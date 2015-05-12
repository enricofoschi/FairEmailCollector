class @Candidate extends Minimongoid
    # indicate which collection to use
    @_collection: new Mongo.Collection('candidates')

    @embeds_many: [
        {
            name: 'jobs'
        }
    ]

    # model defaults
    @defaults:
        first_name: '',
        last_name: '',
        email: ''

    # titleize the name before creation
    @before_create: (attr) ->
        attr.first_name = _.titleize(attr.first_name)
        attr.last_name = _.titleize(attr.last_name)
        attr

    # Add some validation parameters. As long as the @error() method is triggered, then validation will fail
    validate: ->
        unless @first_name and $first_name.length > 3
            @error('first_name', 'Please provide a first name')

    error_message: ->
        msg = ''
        for i in @errors
            for key,value of i
                msg += "<strong>#{key}:</strong> #{value}"
            msg