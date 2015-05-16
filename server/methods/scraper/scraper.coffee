cheerio = Meteor.npmRequire 'cheerio'

Meteor.methods {
    getPage: (url) ->

        @unblock()

        html = Helpers.Server.Communication.GetPage url, {
            normalizeWhitespace: true
        }

        $ = cheerio.load html

        $.html()
}