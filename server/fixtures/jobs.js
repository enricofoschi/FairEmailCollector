Meteor.startup(function onStartupFixture() {

	/* Inserting all missing jobs */
	_.each(serverConfig.jobs, function onJob(job) {

		Jobs.update({
			code: job.code
		}, {
			$set: {
				name: job.name
			}
		}, {
			upsert: true
		});
	});
});