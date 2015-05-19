class @CurrentUserSession extends BaseCollection
    # indicate which collection to use
    @_collection: new Mongo.Collection('user_session_data')

    @before_create: (attr) ->
        attr ||= attr
        attr.updatedAt = (new Date()).UTCFromLocal()
        attr.token = Helpers.Token.GetGuid() + Helpers.Token.GetGuid()
        attr.data = {}
        attr

    @before_save: (attr) ->
        attr ||= attr
        attr.updatedAt = (new Date()).UTCFromLocal()
        attr

    @schema: {
        token:
            type: String
            max: 72
        data:
            blackbox: true,
            type: Object
            label: 'Data'
    }

    @_collection.allow {
        insert: -> true
        update: -> false
        remove: -> false
    }

Meteor.startup( ->

    if Meteor.isServer
        CurrentUserSession._collection._ensureIndex {
            createdAt: 1
        }, {
            expireAfterSeconds: Meteor.settings.sessionLength
        }
)