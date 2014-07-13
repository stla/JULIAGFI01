#module Jgfi

using Distributions

type Line
        a::Float64   # intercept
        b::Float64  # slope
        typ::Bool    # type (true:upper, false:lower)
end

type Ribbon
        aLow::Float64
        aUpp::Float64
        b::Float64
end


function alterate(ncopies, vt, Ztj, df)
  VTnew = cell(ncopies) # could use an array instead
  vt = vt[[2;1],:]
  C = mean(Ztj)
  D = norm(Ztj.-C)
  tau = (Ztj.-C)./D
  Ctil =  1/sqrt(df+1).*randn(ncopies)
  Dtil = rand(Chi(df), ncopies)
  Znew = zeros(Float64, length(Ztj), ncopies)
  for i in 1:ncopies
    Znew[:,i] = Dtil[i].*tau .+ Ctil[i] # est-ce utile de calculer Znew ? - oui pour les altérations futures je pense
    vtnew = zeros(Float64, size(vt))
    for m in 1:size(vt,2)
      munew = vt[1,m] + vt[2,m]*(C-Ctil[i]*D/Dtil[i])
      sigmanew = vt[2,m]*D/Dtil[i]
      vtnew[:,m] = [munew ; sigmanew]
    end
    VTnew[i] = vtnew[[2;1],:]
  end
  return (Znew, VTnew)
end


# extract lower/upper line from ribbon
function Dlow(ribbon::Ribbon)
        Line(ribbon.aLow, ribbon.b, false)
end
function Dupp(ribbon::Ribbon)
        Line(ribbon.aUpp, ribbon.b, true)
end


# find the range - crash if sigma=0
function findRange(poly::Array{Float64,2}, lower::Float64, upper::Float64)
        if ( (minimum(poly[1,:]) > 0) || (maximum(poly[1,:])<0) )
            slopes = [(poly[2,:]-lower)./poly[1,:] (poly[2,:]-upper)./poly[1,:]]
            return [ minimum(slopes) ; maximum(slopes) ]
        else # the y-axis cuts the particle
        println("crossing")
            where = (isInside(poly, lower), isInside(poly, upper))
            if (where[1]=="inside" || where[2]=="inside") # one point is inside
                    return [-Inf, Inf]
            elseif where[1]=="below" && where[2]=="above" # lower is below, upper is above
                    return "nothing to do"
            elseif where[1]=="above"
                    neg = find(poly[1,:].<0)
                    left = minimum((poly[2,neg]-lower)./poly[1,neg])
                    pleft = ccdf(Cauchy(), left)
                    #
                    pos = find(poly[1,:].>0)
                    right = maximum((poly[2,pos]-upper)./poly[1,pos])  # ou (VTsum[i]-l)/sigma[i] avec i <- which.max(sigma)
                    pright = cdf(Cauchy(), right)
                    #
                    p = pleft+pright
                    if rand()<pleft/p return [left ; Inf] else return [-Inf ; right] end
            elseif where[2]=="below"
                    neg = find(poly[1,:].<0)
                    left = maximum((poly[2,neg]-upper)./poly[1,neg])
                    pleft = cdf(Cauchy(), left)
                    #
                    pos = find(poly[1,:].>0)
                    right = minimum((poly[2,pos]-upper)./poly[1,pos])
                    pright = ccdf(Cauchy(), right)
                    #
                    p = pleft+pright
                    if rand()<pleft/p return [Inf ; left] else return [right, Inf] end
            else
                    return "something wrong ! (possibly a vertex on the y-axis)"
            end
        end
end

function isInside(opoly::Array{Float64,2}, a::Float64)
        x1 = vec(opoly[1,:])
        x2 = x1[[2:length(x1); 1]]
        # ceux qui coupent
        cutting = find( x1.*x2 .<0)
        #
        intercepts = (getLine(opoly,cutting[1])[1], getLine(opoly,cutting[2])[1])
        (amin, amax) =( minimum(intercepts) , maximum(intercepts) )
        #
        if a < amin
                return "below"
        elseif a > amax
                return "above"
        else
                return "inside"
        end
end




# converts an edge to (intercept, slope)
function getLine(opoly::Array{Float64,2}, index::Int)
        A = opoly[:,index]
        #B = opoly[:,mod(index,size(opoly,2))+1]
		B = opoly[:,rem1(index+1,size(opoly,2))]
        slope = (B[2]-A[2])/(B[1]-A[1])
        intercept = A[2] - slope*A[1]
        return (intercept, slope)
end

#end


inference = function(vertex, weight, alpha)
    vertex=vec(vertex)
  out = zeros(Float64,4)
  #names(out) = c("mean","median","low","up")
  out[1] = dot(vertex,weight)
  h = [vertex weight]
  hsort = h[sortperm(vertex),:]
  hsum = cumsum(hsort[:,2])
  ci_u = minimum(find(hsum.>=1-alpha/2)) #upper confidence bound
  ci_l = minimum(find(hsum.>=alpha/2))   #lower confidence bound
  ci_m = minimum(find(hsum.>=0.5))
  out[3] = hsort[ci_l,1]  #lower bound
  out[4] = hsort[ci_u,1] #upper bound
  out[2] = hsort[ci_m,1] #estimate
  return out
end


# returns the intersection of two lines given by (intercept, slope)
function intersect(D1, D2)
        x = (D1[1]-D2[1])/(D2[2]-D1[2])
        return [x, D1[1] + D1[2]*x]
end



# returns the polyhedron intersection of two ribbons
function ipart(R1::Ribbon, R2::Ribbon)
	D11 = Dlow(R1); D12 = Dupp(R1); D21 = Dlow(R2);	D22 = Dupp(R2)
	A = intersect((D11.a, D11.b), (D21.a, D21.b));
	B = intersect((D11.a, D11.b), (D22.a, D22.b));
	C = intersect((D12.a, D12.b), (D21.a, D21.b));
	D = intersect((D12.a, D12.b), (D22.a, D22.b));
	return orderPart(hcat(A,B,C,D))
end



# order poly
function orderPart(poly::Array{Float64,2})
        # compute an interior point
        O = [ mean(poly[1,1:3]) , mean(poly[2,1:3]) ]
        # center the polyhedron around O
        cpoly = poly .- O
        # compute the angular parts of polar coordinates
        angles = atan2(cpoly[2,:], cpoly[1,:])
        # find the order
        ord  = sortperm(vec(angles))
        return poly[:,ord]
end


# case one edge to remove
function updatePoly1(oopoly::Array{Float64,2}, D::Line, toRemove::Int)
		opoly = oopoly ## see https://groups.google.com/d/topic/julia-users/PfTZhZu6OMo/discussion
        # first edge
        index = if toRemove==1 size(opoly)[2] else toRemove-1 end
        M = intersect((D.a,D.b), getLine(opoly,index))
        # second edge
        index = if toRemove==size(opoly)[2] 1 else toRemove+1 end
        N = intersect((D.a,D.b), getLine(opoly,index))
        #
        opoly[:,toRemove] = M
        opoly[:,index] = N
        #
        return opoly
end

# case "chanfrein"
function updatePoly2(opoly::Array{Float64,2}, D::Line, Dinters::Array{Int64,1}, test1::BitArray{1})
    # shift to put the two edges at first positions
    ncol = size(opoly)[2]
    if Dinters[2]-Dinters[1] != 1
            arrange = [ncol, [1:ncol-1]]
    else
            arrange = [rem1(i+Dinters[1]-1,ncol)::Int for i=1:ncol] # mod([1:ncol]+Dinters[1]-2, ncol)+1
    end
    opoly = opoly[:, arrange]
    # intersections
    M = intersect((D.a,D.b), getLine(opoly,1))
    N = intersect((D.a,D.b), getLine(opoly,2))
    #
    test = test1[arrange][2]
    if( (!D.typ && !test) || (D.typ && test) )
        return hcat(opoly[:,1], M, N, opoly[:, [3:ncol]])
    else
        return hcat(M, opoly[:,2], N)
    end
end

# general case
function updatePoly(opoly::Array{Float64,2}, D::Line)

        #opoly = deepcopy(poly) # otherwise the function replaces the value !?
            test1 = vec(opoly[2,:]) .> D.a .+ D.b .* vec(opoly[1,:])
            test2 = test1[[2:size(opoly)[2]; 1]]
            test = test1 + test2
            if(D.typ==false)
                Remove = test .== 0
            else
                Remove = test .== 2
            end
            toRemove = find(Remove)
            if length(toRemove) == 1
                    #println("case 1\n")
                    return updatePoly1(opoly, D, toRemove[1])
            elseif length(toRemove) == 0
                    Dinters=find(test.== 1)
                    if length(Dinters) == 2
                        #println("case 2\n")
                        return updatePoly2(opoly, D, Dinters, test1)
                    else
                        return opoly
                    end
            else
                    if Remove[1] && last(Remove)
                        indices = find(!Remove)
                        if length(indices)==0
                            return "stop"
                        end
                        torem =  size(indices)[1]+1
                        # last crash si indices est vide mais ça ne devrait pas arriver
                        indices = [indices; last(indices)+1]
                    else
                        indices = [1:size(opoly)[2]]
                        indices = deleteat!(indices, toRemove[2]:last(toRemove))
                        torem = toRemove[1]
                    end
                    #println("case 3\n")
                    return updatePoly1(opoly[:,indices], D, torem)
            end
end



function fid_basic(ylow, yupp, N, R)
    n = size(ylow,1)
    X = FE = ones(n)
    V = eye(n)
    L = ylow
    U = yupp
    Dim = 2

    # initial sample
    Z = zeros(Float64,n,N)
    Z[:,:] = randn(n,N)
    A = V*Z
    C1 = K_start = [1;2]
    Z[deleteat!([1:size(Z,1)], C1),:] = 0
    VTall = cell(N)
    for j in 1:N
        R1 = Ribbon(L[K_start[1]], U[K_start[1]], -A[K_start[1],j])
        R2 = Ribbon(L[K_start[2]], U[K_start[2]], -A[K_start[2],j])
        VTall[j] = ipart(R1,R2)
    end

    #### sampling k=3, ..., n -----------------------
    weight  = zeros(Float64,n,N)
    WT =  zeros(Float64,N) # si défini dans le for alors pas en sortie du for
    ESS = zeros(Float64,n)
    for k in 3:n
        Z1 = FE[k,:]
        VTall_new = cell(N)
        for j in 1:N
            VTj = VTjcopy = VTall[j]
            VTjcopy[2,:] = Z1*VTj[2,:]
                #println(j)
            mM = findRange(VTjcopy, L[k], U[k])
            y = atan(mM[2])
            x = atan(mM[1])
            u = x+(y-x)*rand()  #runif(1, x, y)
            ZZ = tan(u)
            wt = weight[k,j] = (-ZZ^2/2)+log(1+ZZ^2)+log(y-x)
            # new polygon
            D31 = Line(L[k], ZZ, false)
            D32 = Line(U[k], ZZ, true)
            VTj_update = updatePoly(VTj, D31)
            VTj_update = VTall_new[j] = updatePoly(VTj_update, D32)
            Z[k,j] = -ZZ
        end # END for(j in 1:N)
        VTall = VTall_new

        ### calculate weights   ---------------------------
        WT = vec(cumsum(weight)[end,:])
        if sum(WT)==-Inf
            print("Error: possible underflow")
        end
        WT = exp(WT)./sum(exp(WT))
        ESS[k] = 1./dot(WT,WT)

        ### alteration --------------------------------------
        if ESS[k] < R*N && k<n
        println("alteration")
            N_sons=zeros(Int,N)
            # generate the cumulative distribution
            dist = cumsum(WT)
            aux = rand()    # sample uniform rv in [0 1]
            u = (aux.+[0:(N-1)])./N
            j=1
            for i=1:N
                while u[i]>dist[j]
                    j=j+1
                end
                N_sons[j]=N_sons[j]+1
            end
            Zt = Z[1:k,:]
            Znew = zeros(Float64, k, N)
            VTnew = cell(N)
            start = 0
            for j in find(N_sons.!=0)
              ncopies = N_sons[j]
              VTj = VTall[j]
              VTnew[start+1] = VTj
              Znew[:,start+1] = Zt[:,j]
              if ncopies>1
                alt = alterate(ncopies-1, VTj, Zt[:,j], k-1)
                Znew[:,(start+2):(start+ncopies)] = alt[1]
                VTnew[(start+2):(start+ncopies)] = alt[2]
              end
              start = start+ncopies
            end
            VTall = VTnew
            Z[1:k,:] = Znew
            weight  = zeros(Float64,n,N)
        end # END ALTERATION

    end # END for k in 3:n

    #----------------------------------------------------determine signs
    re = 1
    signs=zeros(Int, re, N)    #
    for i in 1:N
        for j in 1:re
            if reduce(&, VTall[i][1,:].>0) #i.e. all are positive
                signs[j,i] = 1
            elseif reduce(&, VTall[i][1,:].<0)  #i.e. all are negative
                signs[j,i] = -1
            end
        end
    end

    #----------------------------------------------------FINAL RESAMPLE
    for j in 1:N
        alt = alterate(1, VTall[j], Z[:,j], n-1)
        VTall[j] = alt[2][1]
    end


    #----------------------------------------------------flip negatives
    for i in 1:N
        for j in 1:re #only look at random effects
            if signs[j,i]==-1
                VTall[i][1,:] = -VTall[i][1,:]  #only need to flip the negatives
            end
        end
    end

    #----------------------------------------------------pick coordinates
    Dim = 2
    VT_end = zeros(Float64, Dim, N)
    for i in 1:N
        #for(j in 1:Dim){
        if rand()<=0.5
        #if(j<=fe){
          VT_end[2,i] = minimum(VTall[i][2,:])
        #}else{
          VT_end[1,i] = maximum([minimum(VTall[i][1,:]);0])
        #}
        else
          #if(j<=fe){
          VT_end[2,i] = maximum(VTall[i][2,:])
          #}else{
          VT_end[1,i] = maximum([maximum(VTall[i][1,:]);0])
          #}
        end
    end

    return(VT_end, float64(WT))
end


