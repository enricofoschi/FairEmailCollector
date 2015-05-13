Meteor.startup(=>
    for job in serverConfig.jobs

        dbJob = Job.firstOrDefault {
            code: job.code
        }

        dbJob.update {
            code: job.code,
            title: job.title,
            active: true
        }

    for job in Job.all()

        if not serverConfig.jobs.any((x) => x.code is job.code)

            job.update {
                active: false
            }


)