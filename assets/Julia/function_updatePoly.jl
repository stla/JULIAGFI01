# case one edge to remove
function updatePoly1(opoly::Array{BigFloat,2}, D::Line, toRemove::Int)
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
function updatePoly2(opoly::Array{BigFloat,2}, D::Line, Dinters::Array{Int64,1}, test1::BitArray{1})
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
function updatePoly(poly::Array{BigFloat,2}, D::Line) 

        opoly = deepcopy(poly) # otherwise the function replaces the value !?
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
                    println("case 1\n")
                    return updatePoly1(opoly, D, toRemove[1])
            elseif length(toRemove) == 0
                    Dinters=find(test.== 1)
                    if length(Dinters) == 2
                        println("case 2\n")
                        return updatePoly2(opoly, D, Dinters, test1)
                    else
                        return opoly
                    end
            else
                    if Remove[1] && last(Remove)
                        indices = find(!Remove)
                        torem =  size(indices)[1]+1
                        indices = [indices, last(indices)+1]
                    else
                        indices = [1:size(opoly)[2]]
                        indices = deleteat!(indices, toRemove[2]:last(toRemove))
                        torem = toRemove[1]
                    end
                    println("case 3\n")
                    updatePoly1(opoly[:,indices], D, torem)
            end
end
