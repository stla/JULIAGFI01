# include types
for file = ("Line",)
    include(*(pwd(), "/type_", file, ".jl"))
end

# include functions
for file = ("DlowDupp", "intersect", "ipart", "findRange", "getLine", "orderPart", "updatePoly")
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
    Z = randn(n,N)
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
    WT =  zeros(BigFloat,N)
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
    end
     # END for(j in 1:N)
    VTall = VTall_new

    ### calculate weights   ---------------------------
    WT = cumsum(weight)[end,:]
    if sum(WT)==-Inf
      print("Error: possible underflow")
    end
    WT = exp(WT)./sum(exp(WT))
    ESS[k] = 1./dot(WT,WT)

    end # END for k in 3:n

    return(Z, float64(VTall[1]), float64(WT))
end



ylow = [1.5; 2.5; 3.5; 4.5]
yupp = [2.; 3.; 4.; 5.]
N = 2
R = 0.5
println(fid_basic(ylow, yupp, N, R))

