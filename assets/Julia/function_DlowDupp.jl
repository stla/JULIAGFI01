# extract lower line from ribbon
function Dlow(ribbon::Ribbon)
        Line(ribbon.aLow, ribbon.b, false)
end
# extract upper line from ribbon
function Dupp(ribbon::Ribbon)
        Line(ribbon.aUpp, ribbon.b, true)
end
