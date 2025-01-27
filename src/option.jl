#TODO: test all these functions

using Match

struct Option{T}
    value::Union{T,Nothing}
    is_nothing::Bool
end

#TEST: The following functions need testing 

# Constructs an Option{T} value
function some(value::Any)
    @match value begin
        ::Nothing => return Option(Nothing, true)
        _ => return Option(value, false)
    end
end

# Tests if there is a Nothing value held within the option
function is_nothing(option::Option)
    @match option.is_nothing begin
        true => return true
        _ => return false
    end
end

# Tests if there is some value held within the option function
function is_some(option::Option)
    @match option.is_nothing begin
        false => return true
        _ => return false
    end
end

# Unwraps the data held in the Option{T} structure, will throw error if Nothing
function unwrap(option::Option)
    @match option.is_nothing begin
        true => return throw("Cannot unwrap on a Nothing value")
        _ => return option.value
    end
end

# Unwraps the data held in Option{T}, if Nothing will throw with the Error String provided
function expect(option::Option, error::String)
    @match option.is_nothing begin
        true => return throw(error)
        _ => return option.value
    end
end

# Tests if it is Nothing, if false will execute the anonymous function f
function is_nothing_or(option::Option, f)
    @match option.is_nothing begin
        true => return true
        _ => return f(unwrap(option))
    end
end

# Unwrap the option or return the provided input alternative 
function unwrap_and(option::Option, alternative)
    @match option.is_nothing begin
        true => return alternative
        _ => return unwrap(option)
    end
end

macro pull!(option)
    @match !(option isa Option) || !(option isa Result) begin
        true => return :($(esc(option)).value)
        _ => return :($(esc(typeof(option))))
    end
end

