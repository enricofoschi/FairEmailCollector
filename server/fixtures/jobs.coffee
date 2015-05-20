Meteor.startup(=>
    for job in Meteor.settings.jobs

        dbJob = Job.first {
            code: job.code
        }

        data = {
            code: job.code,
            title: job.title,
            active: true
        }

        if dbJob
            dbJob.update data
        else
            dbJob = Job.create data
            console.log dbJob.errors

    for job in Job.all()

        if not Meteor.settings.jobs.any((x) => x.code is job.code)

            job.update {
                active: false
            }


)