if Meteor.settings.kadiraAuth?.appId and Meteor.settings.kadiraAuth.on
    Kadira.connect Meteor.settings.kadira.appId, Meteor.settings.kadira.appSecret