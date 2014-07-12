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
