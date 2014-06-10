using Gadfly
function plotPart(poly::Array{BigFloat,2})
        poly = orderPart(poly)
        x = float64(poly[1,[1:size(poly,2);1]])
        y = float64(poly[2,[1:size(poly,2);1]])
        p = plot(x = x, y = y, Geom.point, Geom.line(preserve_order=true))
        return p
end

function plotPartAndD(poly::Array{BigFloat,2}, D::Line)
        poly = orderPart(poly)
        x = float64(poly[1,[1:size(poly,2);1]])
        y = float64(poly[2,[1:size(poly,2);1]])
        xD = float64([minimum(x) maximum(x)])
        yD = float64(D.a+D.b*xD)
        p = plot(layer(x = x, y = y, Geom.point, Geom.line(preserve_order=true)), layer(x=xD, y=yD, Geom.line, Theme(default_color=color("red"))))
        return p
end
