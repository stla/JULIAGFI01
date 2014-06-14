# first ribbon: (ne pas lancer le comment en 1ère ligne)
R1 = Ribbon(0.4, 2.5, BigFloat("1.5"));
D1_low = Dlow(R1);
D1_upp = Dupp(R1);
# second ribbon:
R2 = Ribbon(1.0, 2.0, BigFloat("-2"));
D2_low = Dlow(R2);
D2_upp = Dupp(R2);

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
#draw(PNG("sample02.png", 300px, 200px), p)
#draw(D3("sample02.js", 630px, 340px), p)


# new ribbon
a_low = 2.;
a_upp = 3.;
println("range:", float64(findRange(poly, a_low, a_upp)))

R3 = Ribbon(a_low, a_upp, BigFloat("0.5"))

