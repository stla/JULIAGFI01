# generates a new line with given intercept and slope
function newLine(a::Float64, b::BigFloat, typ::Bool)
        return Line(a, b, typ)
end
