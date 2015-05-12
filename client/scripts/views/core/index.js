(function onCoreIndex(globalContext, template) {
	"use strict";

	Helpers.Client.Application.addCallbacksToTemplate(template.viewName, [
		'adaptive-label'
	]);

	template.helpers({
		jobRows: function jobRows() {
			return Jobs.find().fetch().toMatrix(3);
		}
	});

})(this, Template['core.index']);