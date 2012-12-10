require [
	"jquery",
	"jade",
	"backbone",
	"marionette",
	"app/models/MainViewModel",
	"app/views/MainView"
], ($, jade, Backbone, Marionette, MainViewModel, MainView) ->

	App = new Marionette.Application()

	Marionette.TemplateCache.prototype.compileTemplate = (tmplStr) ->
		console.log "jade stuff: ", jade.compile(tmplStr)
		return jade.compile(tmplStr)

	# init router
	App.addInitializer ->
		AppRouter = Marionette.AppRouter.extend 
			appRoutes: 
				"": "index"
			controller:
				index: ->
					console.log "Hello!!!"

		new AppRouter()

		Backbone.history.start()

	# init regions
	App.addInitializer ->
		App.addRegions 
			mainRegion: "#main"
			sidebar: "#sidebar"
			
	$ ->
		App.start({})

		mainViewModel = new MainViewModel
			title: "Hello from model"
			content: "I am just some content"

		mainView = new MainView
			model: mainViewModel

		App.mainRegion.show(mainView)
		