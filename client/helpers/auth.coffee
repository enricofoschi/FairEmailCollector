class @Helpers.Client.Auth

    @IsLoggedIn: ->
        Session.get 'loggedIn'