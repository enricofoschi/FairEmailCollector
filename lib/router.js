Router.configure({
    layoutTemplate: 'ApplicationLayout',
	loadingTemplate: 'loader',
	waitOn: function waitOn() {
		return [
			Meteor.subscribe('jobs')
		];
	}
});


Router.route('/', {
	action: function action() {
		this.render('core.index');
	},
	data: function () {
		return Jobs;
	}
});
