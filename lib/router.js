Router.configure({
    layoutTemplate: 'ApplicationLayout'
});

Router.route('/', function () {
    this.render('core_index');
});