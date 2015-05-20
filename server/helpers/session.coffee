Global = @

class @Helpers.Server.Session

    connections = []

    @RemoveToken: (connection) ->

        if connections[connection.id]
            delete connections[connection.id]

    @SetToken: (connection, token) ->
        connections[connection.id] = token

    @Set: (connection, key, value, forClient=false) ->

        if connections[connection.id]
            sessionData = null

            sessionData = CurrentUserSession.firstOrCreate {
                token: connections[connection.id]
            }

            sessionData.setData key, value, forClient

    Meteor.server.onConnection (connection) ->
        connection.onClose ->
            Helpers.Server.Session.RemoveToken connection