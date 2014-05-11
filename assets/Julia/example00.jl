
# set current directory
cd("D:/Github/JuliaGFI01/assets/Julia/")

# include types
file = "Line"
    include(*(pwd(), "\\type_", file, ".jl"))

# include functions
for file = ("newLine", "intersect", "findRange", "getLine", "orderPart", "plotPart")
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
poly = hcat(A,B,C,D)

#######################
## plot the particle ##
#######################
#p = plotPart(poly)
#draw(PNG("part0x1.png", 300px, 200px), p)
#draw(D3("part01.js", 650px, 350px), p)


# new ribbon
a_low = 2.;
a_upp = 3.;
println("range:", float64(findRange(poly, a_low, a_upp)))
D3_low = newLine(a_low, BigFloat("0.5"), false);
D3_upp = newLine(a_upp, BigFloat("0.5"), true);

 #

opoly = orderPart(poly)
x1 = vec(opoly[1,:])
y1 = vec(opoly[2,:])
x2 = x1[[2:length(x1); 1]]
y2 = y1[[2:length(x1); 1]]

for D = (D3_low, D3_upp)
    test1 = y1 .> D.a .+ D.b .* x1
    test2 = y2 .> D.a .+ D.b .* x2
    test = test1 + test2
    if(D.typ==false)
        toRemove = test .== 0
    else
        toRemove = test .== 2
    end
    Dinters = find(test.== 1) # should be 0 or 2 elements
    toAdd = false
    if length(Dinters) == 2
        for i = (1,2) # we calculate the two vertices on D
            inter = intersect((D.a,D.b), getLine(opoly,Dinters[i]))
        end # endfor i=1,2
        toAdd = true
    end # endif length(Dinters) == 2
    opoly = opoly[:,!toRemove]
    if toAdd
        opoly = hcat(opoly,inter)
    end
end # endfor D = (D3_low, D3_upp)
poly = opoly
