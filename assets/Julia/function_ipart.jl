# returns the polyhedron intersection of two ribbons
function ipart(R1::Ribbon, R2::Ribbon)
	D11 = Dlow(R1); D12 = Dupp(R1); D21 = Dlow(R2);	D22 = Dupp(R2)
	A = intersect((D11.a, D11.b), (D21.a, D21.b));
	B = intersect((D11.a, D11.b), (D22.a, D22.b));
	C = intersect((D12.a, D12.b), (D21.a, D21.b));
	D = intersect((D12.a, D12.b), (D22.a, D22.b));
	return orderPart(hcat(A,B,C,D))
end

