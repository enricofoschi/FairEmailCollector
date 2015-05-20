Meteor.methods {
    'checkAdminPasswordAccess': (password) ->
        if password is Meteor.settings.accessPassword
            data = Helpers.Server.Auth.SetAsLoggedIn @connection
            _.extend data.forClient(), {
                success: true
            }
}