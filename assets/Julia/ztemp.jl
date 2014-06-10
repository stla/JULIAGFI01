using Distributions

# set current directory
cd("D:/Github/JuliaGFI01/assets/Julia/")

# include types
for file = ("Line",)
    include(*(pwd(), "\\type_", file, ".jl"))
end

# include functions
for file = ("DlowDupp", "intersect", "findRange", "getLine", "orderPart", "plotPart", "updatePoly")
    include(*(pwd(), "\\function_", file, ".jl"))
end


# first ribbon: (ne pas lancer le comment en 1ère ligne)
R1 = Ribbon(0.4, 1.5, BigFloat("1.5"));
D1_low = Dlow(R1);
D1_upp = Dupp(R1);
# second ribbon:
R2 = Ribbon(4.5, 5.9, BigFloat("-2"));
D2_low = Dlow(R2);
D2_upp = Dupp(R2);

# find the intersections:
A = intersect((D1_low.a, D1_low.b), (D2_low.a, D2_low.b));
B = intersect((D1_low.a, D1_low.b), (D2_upp.a, D2_upp.b));
C = intersect((D1_upp.a, D1_upp.b), (D2_low.a, D2_low.b));
D = intersect((D1_upp.a, D1_upp.b), (D2_upp.a, D2_upp.b));

# particle:
poly0 = poly = orderPart(hcat(A,B,C,D))


## simulations
srand(666)

poly=deepcopy(poly0)
for i = 1:400
    a_low = rand(Normal(3,1))
    a_upp = a_low +1
    mM = findRange(poly, a_low, a_upp)
    println("range:", float64(mM))
    b = mM[1] +(mM[2]-mM[1])*rand()
    println(float64(b));
    R3 = Ribbon(a_low, a_upp, b)
    poly = poly1 = updatePoly(poly, Dlow(R3))
    poly = poly2 = updatePoly(poly, Dupp(R3))
end

float64(poly0)
float64(poly)

#p= plotPartAndD(poly, D)
#draw(PNG("xx.png", 300px, 200px), p)
