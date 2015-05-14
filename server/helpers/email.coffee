class @Helpers.Email

    templates = {}

    head = null
    foot = null

    styleMain = "font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.6; font-weight: normal; "
    styleMain14 = styleMain += 'font-size: 14px; '


    @Init: (template, helpers) ->

        if not templates[template]
            html = Assets.getText "templates/email/#{template}.html"
            SSR.compileTemplate template, html

            helpers = _.extend {
                styleMain: styleMain,
                styleMain14: styleMain14,
                styleParagraph: styleMain14 + ' margin: 0 0 10px; padding: 0;'
            }, helpers ||= {}

            Template[template].helpers helpers

            templates[template] = true

        if not head or not foot
            head = Assets.getText 'templates/email/base/head.html'
            foot = Assets.getText 'templates/email/base/foot.html'

    @GetBody: (properties) ->

        @Init properties.template, properties.helpers

        html = head.format properties.title
        html += SSR.render properties.template, properties.data
        html += foot

        html

    @Send: (options) ->

        html = @GetBody {
            template:   options.template
            title:      options.subject
            data:       options.data
            helpers:    options.helpers
        }

        sender = new Mailgun {
            apiKey: serverConfig.mailgun.apiKey
            domain: serverConfig.mailgun.domain
        }

        sender.send {
            from:       serverConfig.mailgun.from
            to:         options.to
            subject:    options.subject
            html:       html
        }