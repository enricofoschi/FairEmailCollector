String::format = (params...) ->
    return @replace /{(\d+)}/g, (match, number) ->
        if params[number] then params[number] else match