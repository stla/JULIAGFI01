type Line
        a::Float64   # intercept
        b::BigFloat  # slope
        typ::Bool    # type of the line (true:upper, false:lower)
end

type Ribbon
        aLow::Float64
        aUpp::Float64
        b::BigFloat
end
