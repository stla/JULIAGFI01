# find the range - crash if sigma=0
function findRange(poly::Array{BigFloat,2}, lower::Float64, upper::Float64)
        if ( (minimum(poly[1,:]) > 0) || (maximum(poly[1,:])<0) )
            slopes = [(poly[2,:]-lower)./poly[1,:] (poly[2,:]-upper)./poly[1,:]]
            return [ minimum(slopes) ; maximum(slopes) ]
        else # the y-axis cuts the particle
        println("crossing")
            where = (isInside(poly, lower), isInside(poly, upper))
            if (where[1]=="inside" || where[2]=="inside") # one point is inside
                    return [-Inf, Inf]
            elseif where[1]=="below" && where[2]=="above" # lower is below, upper is above
                    return "nothing to do"
            elseif where[1]=="above"
                    neg = find(poly[1,:].<0)
                    left = minimum((poly[2,neg]-lower)./poly[1,neg])
                    pleft = ccdf(Cauchy(), left)
                    #
                    pos = find(poly[1,:].>0)
                    right = maximum((poly[2,pos]-upper)./poly[1,pos])  # ou (VTsum[i]-l)/sigma[i] avec i <- which.max(sigma)
                    pright = cdf(Cauchy(), right)
                    #
                    p = pleft+pright
                    if rand()<pleft/p return [left ; Inf] else return [-Inf ; right] end
            elseif where[2]=="below"
                    neg = find(poly[1,:].<0)
                    left = maximum((poly[2,neg]-upper)./poly[1,neg])
                    pleft = cdf(Cauchy(), left)
                    #
                    pos = find(poly[1,:].>0)
                    right = minimum((poly[2,pos]-upper)./poly[1,pos])
                    pright = ccdf(Cauchy(), right)
                    #
                    p = pleft+pright
                    if rand()<pleft/p return [Inf ; left] else return [right, Inf] end
            else
                    return "something wrong ! (possibly a vertex on the y-axis)"
            end
        end
end

function isInside(opoly::Array{BigFloat,2}, a::Float64)
        x1 = vec(opoly[1,:])
        x2 = x1[[2:length(x1); 1]]
        # ceux qui coupent
        cutting = find( x1.*x2 .<0)
        #
        intercepts = (getLine(opoly,cutting[1])[1], getLine(opoly,cutting[2])[1])
        (amin, amax) =( minimum(intercepts) , maximum(intercepts) )
        #
        if a < amin
                return "below"
        elseif a > amax
                return "above"
        else
                return "inside"
        end
end


# test whether a point (0,a) is inside the polyhedron
function isInside_trash(poly::Array{BigFloat,2}, a::Float64)
        polyright = poly[:, find(poly[1,:] .> 0)]
        polyleft = poly[:, find(poly[1,:] .< 0)]
        slopes_right = (polyright[2,:] - a)./polyright[1,:]
        slopes_left = (polyleft[2,:] - a)./polyleft[1,:]
        extrem_right = findmin(abs(slopes_right))[2]
        extrem_left = findmin(abs(slopes_left))[2]
        #
        angle1 = atan2(polyright[1,extrem_right], polyright[2,extrem_right] - a)
        angle2 = atan2(polyleft[1,extrem_left], polyleft[2,extrem_left] - a)
        return angle1 - angle2
end
