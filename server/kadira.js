if(serverConfig.kadira.appId) {
	console.log('With Kadira');
	Kadira.connect(serverConfig.kadira.appId, serverConfig.kadira.appSecret);
}