module StdError

include("option.jl")
export some
export is_some
export is_nothing
export unwrap
export unwrap_and
export expect
export @pull!

include("result.jl")


end
