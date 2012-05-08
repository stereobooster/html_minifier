var exports = (function () {
	var logs = [];
	return {
		console: {
			log: function (message) {
				logs.push(message);
			},
			get: function () {
				return logs;
			},
			clear: function () {
				logs = [];
			}
		}
	};
})();
