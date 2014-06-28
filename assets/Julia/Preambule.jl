using Distributions

# set current directory
cd("/home/stla/Github/JULIAGFI01/assets/Julia/")

# include types
for file = ("Line",)
    include(*(pwd(), "/type_", file, ".jl"))
end

# include functions
for file = ("DlowDupp", "intersect", "findRange", "getLine", "orderPart", "plotPart", "updatePoly")
    include(*(pwd(), "/function_", file, ".jl"))
end

