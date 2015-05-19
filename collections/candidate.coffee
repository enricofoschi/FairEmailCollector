class @Candidate extends BaseCollection
    # indicate which collection to use
    @_collection: new Mongo.Collection('candidates')

    @embeds_many: [
        {
            name: 'jobs'
        }
    ]

    @schema: {
        jobs:
            type: [new SimpleSchema(Job.schema)]
            optional: true
        firstName:
            type: String
            label: 'First Name'
            max: 100
            autoValue: ->
                if @isSet
                    return _.titleize @value
        lastName:
            type: String
            label: 'Last Name'
            max: 100,
            optional: true
            autoValue: ->
                if @isSet
                    return _.titleize @value
        email:
            type: String
            label: 'Email'
            max: 255
            regEx: SimpleSchema.RegEx.Email
    }

    @_collection.allow {
        insert: -> true
        update: -> true
    }