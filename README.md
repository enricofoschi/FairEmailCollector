# Fair Email Collector

Simple app I created to give stand presenters in a job fair the ability to capture potential candidate details (name + email) and interests.

## Microframework

The cool thing about this app is that it gave me a chance to develop a microframework that I'll soon package and re-use on all future meteor project. It is based on:

* Sass + Compass
* Bootstrap + Fontawesome
* Underscore
* Coffeescript
* Iron Router
* Reactive Var
* Minimongoid to create entity models on top of collection definitions, with a couple of core patches
* Collection2 & Simpleschema to enforce schemas on mongo entities, with validation integrated in Minimongoid
* Autoform for automatic form generation
* Mailgun API + Email template rendering on server side
* Admin interface for mongo objects
* Kadira monitoring

Just clone it, update your settings.json (template: settings.default.json), run 

'''shell
meteor --settings=settings.default.json
'''

and browse:

http://localhost:3000 - main app
http://localhost:3000/admin - mongo admin