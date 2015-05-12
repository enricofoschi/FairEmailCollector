class @Job extends BaseCollection
    # indicate which collection to use
    @_collection: new Mongo.Collection('jobs')

    # model defaults
    @defaults:
        name: '',
        code: '',
        active: true

    # titleize the name before creation
    @before_create: (attr) ->
        attr.name = _.titleize(attr.name)
        attr

    # Add some validation parameters. As long as the @error() method is triggered, then validation will fail
    validate: ->
        unless @name
            @error('name', 'Please provide a job name')
        unless @code
            @error('code', 'Please provide a job code')

    error_message: ->
        msg = ''
        for i in @errors
            for key,value of i
                msg += "<strong>#{key}:</strong> #{value}"
            msg