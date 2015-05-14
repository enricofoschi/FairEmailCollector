Meteor.publish 'candidates', ->
    Candidate.find()