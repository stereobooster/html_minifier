(function (global) {
	var logs = [];
	global.console = {
		log: function (message) {
			logs.push(message);
		},
		get: function () {
			return logs;
		},
		clear: function () {
			var ret = logs;
			logs = [];
			return ret;
		}
	};
}(this));
