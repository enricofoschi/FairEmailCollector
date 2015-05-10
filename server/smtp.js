Meteor.startup(function () {
    console.log(coreConfig);
    process.env.MAIL_URL = 'smtp://' + coreConfig.username  + ':' + coreConfig.password + '@smtp.sendgrid.net:587';
});