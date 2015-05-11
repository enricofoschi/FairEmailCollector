(function onInit(globalContext) {
	"use strict";

	globalContext.Helpers = {};
	globalContext.Helpers.Core = {

		/* Given a nested identifier e.g. root.controller.view, this function
		 * will ensure that each object path exists, initialising it if not.
		 * It returns the reference to the nested object.
		 */
		ensure: function ensure(pathToEnsure) {
			var parts = pathToEnsure.split('.');

			var partIndex = 0;

			var pathContainer = globalContext;

			while(partIndex < parts.length) {

				if(!pathContainer[parts[partIndex]]) {
					pathContainer[parts[partIndex]] = {};
				}

				pathContainer = pathContainer[parts[partIndex]];

				partIndex++;
			}

			return pathContainer;
		}
	};
})(this);