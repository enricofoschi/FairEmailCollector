Meteor.startup( =>
    if serverConfig?.smtp?.username
        process.env.MAIL_URL = "smtp://#{serverConfig.smtp.username}:#{serverConfig.smtp.password}@#{serverConfig.smtp.server}"
)