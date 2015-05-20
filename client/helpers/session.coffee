class @Helpers.Client.Session

    TOKEN_KEY = 'token'
    CLIENT_DATA = 'client'

    @EnsureToken: ->
        token = Helpers.Client.Storage.Get TOKEN_KEY
        created = false

        console.log 'Found ' + token

        if not token
            Meteor.call 'getNewSessionToken', (errors, results) ->
                if not errors
                    console.log 'Stored ' + token
                    token = results.token
                    created = true
                    Helpers.Client.Storage.Set TOKEN_KEY, token
                    Helpers.Client.Storage.Set CLIENT_DATA, results.clientData

        if token and not created
            console.log 'Persisting ' + token
            Meteor.call 'persistSessionToken', token, (errors, results) ->
                Helpers.Client.Storage.Set TOKEN_KEY, token
                Helpers.Client.Storage.Set CLIENT_DATA, results.clientData