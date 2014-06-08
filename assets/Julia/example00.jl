
# set current directory
cd("D:/Github/JuliaGFI01/assets/Julia/")

# include types
for file = ("Line",)
    include(*(pwd(), "\\type_", file, ".jl"))
end

# include functions
for file = ("newLine", "intersect", "findRange", "getLine", "orderPart", "plotPart", "updatePoly")
    include(*(pwd(), "\\function_", file, ".jl"))
end


# first ribbon: (ne pas lancer le comment en 1ère ligne)
D1_low = newLine(0.4, BigFloat("1.5"), false);
D1_upp = newLine(1.5, BigFloat("1.5"), true);
# second ribbon:
D2_low = newLine(4.5, BigFloat("-2"), false);
D2_upp = newLine(5.9, BigFloat("-2"), true);

# find the intersections:
A = intersect((D1_low.a, D1_low.b), (D2_low.a, D2_low.b));
B = intersect((D1_low.a, D1_low.b), (D2_upp.a, D2_upp.b));
C = intersect((D1_upp.a, D1_upp.b), (D2_low.a, D2_low.b));
D = intersect((D1_upp.a, D1_upp.b), (D2_upp.a, D2_upp.b));

# particle:
poly0 = poly = orderPart(hcat(A,B,C,D))

#######################
## plot the particle ##
#######################
#p = plotPart(poly)
#draw(PNG("part0x1.png", 300px, 200px), p)
#draw(D3("part01.js", 630px, 340px), p)


# new ribbon
a_low = 2.;
a_upp = 3.;
println("range:", float64(findRange(poly, a_low, a_upp)))

R3 = Ribbon(a_low, a_upp, BigFloat("0.5"))

float64(poly)
float64(updatePoly(poly, Dlow(R3)))

R4 = Ribbon(a_low, a_upp, BigFloat("0.2"));
float64(updatePoly(poly, Dlow(R4)))
float64(updatePoly(poly, Dupp(R4)))




# rq : sortir un poly ordonné serait mieux
#float64(updatePoly(poly, D3_low, D3_upp))

float64(poly0)
poly=poly0
for (a_low, a_upp) = ((2.,3.), )# (3.2,3.9))
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


#draw(PNG("part02.png", 630px, 340px), p)
#draw(D3("part02.js", 300px, 190px), p)
