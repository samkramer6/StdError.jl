include("../src/StdError.jl")
using .StdError
using Test
using Pkg
Pkg.instantiate()
Pkg.resolve()
Pkg.activate()

@testset "StdError.jl" begin
  # Write your tests here.
end
