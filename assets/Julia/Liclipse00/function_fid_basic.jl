using Distributions

# include types
for file = ("Line",)
    include(*(pwd(), "/type_", file, ".jl"))
end

# include functions
for file = ("inference", "alterate", "DlowDupp", "intersect", "ipart", "findRange", "getLine", "orderPart", "updatePoly")
    include(*(pwd(), "/function_", file, ".jl"))
end

function fid_basic(ylow, yupp, N, R)
    n = size(ylow,1)
    X = FE = ones(n)
    V = eye(n)
    L = ylow
    U = yupp
    Dim = 2

    # initial sample
    Z = zeros(BigFloat,n,N)
    Z[:,:] = randn(n,N)
    A = V*Z
    C1 = K_start = [1;2]
    Z[deleteat!([1:size(Z,1)], C1),:] = 0
    VTall = cell(N)
    for j in 1:N
        R1 = Ribbon(L[K_start[1]], U[K_start[1]], BigFloat(-A[K_start[1],j]))
        R2 = Ribbon(L[K_start[2]], U[K_start[2]], BigFloat(-A[K_start[2],j]))
        VTall[j] = ipart(R1,R2)
    end

    #### sampling k=3, ..., n -----------------------
    weight  = zeros(BigFloat,n,N)
    WT =  zeros(BigFloat,N) # si défini dans le for alors pas en sortie du for
    ESS = zeros(BigFloat,n)
    for k in 3:n
        Z1 = FE[k,:]
        VTall_new = cell(N)
        for j in 1:N
            VTj = VTjcopy = VTall[j]
            VTjcopy[2,:] = Z1*VTj[2,:]
                println(j)
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
            Znew = zeros(BigFloat, k, N)
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
            weight  = zeros(BigFloat,n,N)
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



#ylow = [1.5; 2.5; 3.5; 4.5]
#yupp = [2.; 3.; 4.; 5.]
N = 20
R = 0.5
#println(fid_basic(ylow, yupp, N, R))

ylow = [1.624, 2.209, 2.097, 0.558, -0.335, -0.971, -1.65, -2.338, -3.29, -4.291, 2.862, 2.023, -2.336, -0.613, -0.907, 0.354]
yupp = ylow+0.001

(VERTEX,WEIGHT) = fid_basic(ylow, yupp, N, R);

inference(VERTEX[1,:], WEIGHT, 0.05)

