Meteor.startup(function onStartupFixture() {

	/* Inserting all missing jobs */
	_.each(serverConfig.jobs, function onJob(job) {

		Jobs.update({
			code: job.code
		}, {
			$set: {
				name: job.name,
				active: true
			}
		}, {
			upsert: true
		});
	});

	var allJobs = Jobs.find().fetch();

	_.each(allJobs, function onJob(dataJob) {
		if(!_.any(serverConfig.jobs, function predicate(configJob) {
				return configJob.code === dataJob.code;
			})) {
			Jobs.update({
				_id: dataJob._id
			}, {
				$set: {
					active: false
				}
			});
		}
	});
});