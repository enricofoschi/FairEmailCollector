(function onArray() {
	"use strict";

	Array.prototype.getMatrix = function getMatrix(maxPerRow) {
		var retMatrix = [];

		var currentRow = [];
		for(var i = 0; i < this.length; i++) {
			currentRow.push(this[i]);

			if(currentRow.length === maxPerRow) {
				retMatrix.push(currentRow);
				currentRow = [];
			}
		}

		if(currentRow.length) {
			retMatrix.push(currentRow);
		}

		return retMatrix;
	}
})();