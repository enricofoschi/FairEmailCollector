Meteor.publish('jobs', function() {
	return Job.find({
		active: true
	});
});