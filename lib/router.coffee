Router.configure {
    layoutTemplate: 'ApplicationLayout'
    loadingTemplate: 'loader'
    waitOn: ->
        [
            Meteor.subscribe 'jobs'
            Meteor.subscribe 'candidates'
        ]
}

Router.route '/', {
    action: ->
        @.render 'core.index'
        return
    data: -> {
        AvailableJob: Job
    }
}

Router.route '/users', {
    action: ->
        @.render 'admin.index'
        return
    data: -> {
        Candidates: Candidate
    }
}