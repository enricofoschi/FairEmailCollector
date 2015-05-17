((template) =>

    Helpers.Client.Application.addCallbacksToTemplate template.viewName, [
        'adaptive-label'
    ]

    template.events {
        'submit #accessForm': (event) ->

            event.preventDefault()

            Helpers.Client.Meteor.CallMethod 'checkAccess',  event.target.loginPassword.value, (errors, results) ->
                if errors
                    sweetAlert("Oops", errors, "error")
                else if not results.success
                    sweetAlert("Mmmm....", "Wrong password. Are you legit?!?", "error")
    }

)(Template['login'])