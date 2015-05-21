String::format = (placeholders) ->

    return @replace /{{[-_a-zA-Z0-9]+}}/g, (match, number) ->
        matchKey = match.substr 2, match.length - 4
        if placeholders[matchKey] then placeholders[matchKey] else match