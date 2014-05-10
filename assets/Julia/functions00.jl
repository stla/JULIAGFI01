type Line
        a::Float64   # intercept
        b::BigFloat  # slope
        typ::Bool    # type of the line (true:upper, false:lower)
end


# generates a new line with given intercept and slope
function newLine(a::Float64, b::BigFloat, typ::Bool)
        return Line(a, b, typ)
end

# converts a segment to (intercept, slope)
function getLine(opoly::Array{BigFloat,2}, index::Int)
        A = opoly[:,index]
        B = opoly[:,mod(index+1,size(poly,2))]
        slope = (B[2]-A[2])/(B[1]-A[1])
        intercept = A[2] - slope*A[1]
        return (intercept, slope)
end


# returns the intersection of two lines given by (intercept, slope)
function intersect(D1, D2)
        x = (D1[1]-D2[1])/(D2[2]-D1[2])
        return [x, D1[1] + D1[2]*x]
end

# find the range
function findRange(poly::Array{BigFloat,2}, lower::Float64, upper::Float64)
        slopes = [(poly[2,:]-lower)./poly[1,:] (poly[2,:]-upper)./poly[1,:]]
        return [minimum(slopes);maximum(slopes)]
end

# order poly
function orderPart(poly::Array{BigFloat,2})
        # compute an interior point
        O = [ mean(poly[1,1:3]) , mean(poly[2,1:3]) ]
        # center the polyhedron around O
        cpoly = poly .- O
        # compute the angular parts of polar coordinates
        angles = atan2(cpoly[2,:], cpoly[1,:])
        # find the order
        ord  = sortperm(vec(angles))
        return poly[:,ord]
end

# plot particle
using Gadfly
function plotPart(poly::Array{BigFloat,2})
        poly = orderPart(poly)
        x = float64(poly[1,[1:size(poly,2);1]])
        y = float64(poly[2,[1:size(poly,2);1]])
        p = plot(x = x, y = y, Geom.point, Geom.line(preserve_order=true))
        return p
end
