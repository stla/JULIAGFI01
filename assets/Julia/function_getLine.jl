# converts a segment to (intercept, slope)
function getLine(opoly::Array{BigFloat,2}, index::Int)
        A = opoly[:,index]
        B = opoly[:,mod(index+1,size(poly,2))]
        slope = (B[2]-A[2])/(B[1]-A[1])
        intercept = A[2] - slope*A[1]
        return (intercept, slope)
end
