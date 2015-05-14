Meteor.methods {
    notifyOnCandidate: (candidate, jobs) ->

        @unblock()

        Helpers.Email.Send {
            template: 'alert'
            subject: 'New Candidate'
            to: 'foschi.enrico@gmail.com'
            data: {
                candidate: candidate
                jobs: jobs
            }

        }
}