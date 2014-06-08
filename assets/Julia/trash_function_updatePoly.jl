function updatePoly(poly::Array{BigFloat,2}, D3_low::Line, D3_upp::Line)
        opoly=poly
        for D = (D3_low, D3_upp)
                opoly = orderPart(opoly)
                x1 = vec(opoly[1,:])
                y1 = vec(opoly[2,:])
                x2 = x1[[2:length(x1); 1]]
                y2 = y1[[2:length(x1); 1]]
            test1 = y1 .> D.a .+ D.b .* x1
            test2 = y2 .> D.a .+ D.b .* x2
            test = test1 + test2
            if(D.typ==false)
                toRemove = test .== 0
            else
                toRemove = test .== 2
            end
            Dinters = find(test.== 1) # should be 0 or 2 elements
            println("inters: " , length(Dinters))
            toAdd = false
            if length(Dinters) == 2
                inter = Array(BigFloat,2,0)
                for i = (1,2) # we calculate the two vertices on D
                    inter = hcat(inter, intersect((D.a,D.b), getLine(opoly,Dinters[i])))
                end # endfor i=1,2
                toAdd = true
            end # endif length(Dinters) == 2
            opoly = opoly[:,!toRemove]
            if toAdd
                opoly[:, = hcat(opoly,inter) # NON il y a une ligne ou deux à remplacer par une ou deux lignes
            end
            toAdd = false
        end # endfor D = (D3_low, D3_upp)
        return opoly
end
