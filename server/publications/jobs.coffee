Meteor.publish 'jobs', ->
    Job.find {
        active: true
    }