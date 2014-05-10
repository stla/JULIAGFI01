# find the range
function findRange(poly::Array{BigFloat,2}, lower::Float64, upper::Float64)
        slopes = [(poly[2,:]-lower)./poly[1,:] (poly[2,:]-upper)./poly[1,:]]
        return [minimum(slopes);maximum(slopes)]
end
