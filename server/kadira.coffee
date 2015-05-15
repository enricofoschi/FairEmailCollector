if Meteor.settings.kadira?.appId and Meteor.settings.kadira.on
	Kadira.connect Meteor.settings.kadira.appId, Meteor.settings.kadira.appSecret