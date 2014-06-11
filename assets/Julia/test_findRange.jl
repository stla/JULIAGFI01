
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
poly[1,:] = poly[1,:] - 1
#p = plotPart(poly)
#draw(PNG("case2.png", 300px, 200px), p)

isInside(poly, 2.0)




