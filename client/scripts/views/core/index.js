(function onCoreIndex(globalContext, template) {
	"use strict";

	Helpers.Client.Application.addCallbacksToTemplate(template.viewName, [
		'adaptive-label'
	]);

	function isJobSelected(job) {
		return _.any(getSelectedJobs(), function onAvailableJob(availableJob) {
			return availableJob._id === job._id;
		});
	}

	function getSelectedJobs() {
		return Template.instance().data.selectedJobs.get();
	}

	function setSelectedJobs(selectedJobs) {
		return Template.instance().data.selectedJobs.set(selectedJobs);
	}

	template.created = function created() {
		this.data.availableJobsMatrix = this.data.AvailableJob.find().fetch().toMatrix(3);

		this.data.selectedJobs = new ReactiveVar();
		setSelectedJobs([]);
	};

	template.helpers({
		isSelected: function isSelected() {
			return isJobSelected(this);
		}
	});

	template.events({
		'click .job': function onJobClick(source, templateInstance) {

			var clickedJob = this;

			var alreadySelected = isJobSelected(clickedJob);

			var selectedJobs = getSelectedJobs();

			if(alreadySelected) {
				selectedJobs = _.reject(selectedJobs, function onLoop(selectedJob) {
					return selectedJob._id === clickedJob._id;
				});
			} else {
				selectedJobs.push(clickedJob);
			}

			setSelectedJobs(selectedJobs);
		}
	});

})(this, Template['core.index']);