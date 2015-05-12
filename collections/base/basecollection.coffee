class @BaseCollection extends Minimongoid

    @firstOrDefault: (selector = {}, options = {}, defaults = {}) ->

        doc = @first selector, options

        if not doc
            doc = @create defaults

        doc

    @all: (selector = {}, options = {}) ->
        (@find selector, options).fetch()