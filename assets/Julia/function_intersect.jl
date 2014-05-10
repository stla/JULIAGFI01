# returns the intersection of two lines given by (intercept, slope)
function intersect(D1, D2)
        x = (D1[1]-D2[1])/(D2[2]-D1[2])
        return [x, D1[1] + D1[2]*x]
end
