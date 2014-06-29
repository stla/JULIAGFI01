using Gadfly
function plotPart(poly::Array{BigFloat,2})
        poly = orderPart(poly)
        x = float64(poly[1,[1:size(poly,2);1]])
        y = float64(poly[2,[1:size(poly,2);1]])
        p = plot(x = x, y = y, Geom.point, Geom.line(preserve_order=true))
        return p
end

function plotPartAndD(poly::Array{BigFloat,2}, D::Line, inter::Bool)
        poly = orderPart(poly)
        x = float64(poly[1,[1:size(poly,2);1]])
        y = float64(poly[2,[1:size(poly,2);1]])
        xD = float64([minimum(x) maximum(x)])
        yD = float64(D.a+D.b*xD)
        if !inter 
			p = plot(layer(x = x, y = y, Geom.point, Geom.line(preserve_order=true)), layer(x=xD, y=yD, Geom.line, Theme(default_color=color("red"))))
			return p
		else
			upoly = updatePoly(poly,D)
			ux = float64(upoly[1,[1:size(upoly,2);1]])
			uy = float64(upoly[2,[1:size(upoly,2);1]])
			p = plot(layer(x = x, y = y, Geom.point, Geom.line(preserve_order=true), Theme(default_color=color("blue"))), layer(x=xD, y=yD, Geom.line, Theme(default_color=color("red"))), layer(x = ux, y = uy, Geom.point, Geom.line(preserve_order=true)), Theme(default_color=color("black")))
			return p
		end
end
