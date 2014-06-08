function Dlow(ribbon::Ribbon)
        Line(ribbon.aLow, ribbon.b, false)
end

function Dupp(ribbon::Ribbon)
        Line(ribbon.aUpp, ribbon.b, true)
end
