(function onCoreIndex(globalContext, template) {
	"use strict";

	Helpers.Client.Application.addCallbacksToTemplate(template.viewName, [
		'adaptive-label'
	]);
})(this, Template['core.index']);