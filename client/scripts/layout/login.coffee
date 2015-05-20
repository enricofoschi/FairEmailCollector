((template) =>

    Helpers.Client.Application.addCallbacksToTemplate template.viewName, [
        'adaptive-label'
    ]

    template.events {
        'submit #accessForm': (event) ->

            event.preventDefault()

            Helpers.Client.Meteor.CallMethod 'checkAdminPasswordAccess',  event.target.loginPassword.value, (errors, results) ->
                if errors
                    sweetAlert("Oops", errors, "error")
                else if not results?.success or not results?.clientData
                    sweetAlert("Mmmm....", "Wrong password. Are you legit?!?", "error")
                else
                    Helpers.Client.SessionHelper.ParseClientData results.clientData
    }

)(Template['login'])