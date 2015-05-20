class @Helpers.Server.Auth

    KEY_LOGGED_IN = 'loggedIn'

    @SetAsLoggedIn: (connection) ->
        Helpers.Server.Session.Set connection, KEY_LOGGED_IN, true, true, true

    @SetAsLoggedOut: (connection) ->
        Helpers.Server.Session.Set connection, KEY_LOGGED_IN, null, true, true

