#Helpers.Core.WaitFor
class @Job extends BaseCollection
    # indicate which collection to use
    @_collection: new Mongo.Collection('jobs')

    # titleize the name before creation
    @before_create: (attr) ->
        attr.title = _.titleize(attr.title)
        attr

    @schema: {
        title:
            type: String,
            max: 255
        code:
            type: String,
            max: 5
        active:
            type: Boolean,
            defaultValue: true
    }