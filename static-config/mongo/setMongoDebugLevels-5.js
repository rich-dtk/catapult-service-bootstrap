
(function setDebugLevels() {
	db.setLogLevel(5,"command");
	db.setLogLevel(5,"index");
	db.setLogLevel(5,"network");
	db.setLogLevel(5,"query");
	db.setLogLevel(5,"transaction");
	db.setLogLevel(5,"write");
})();

