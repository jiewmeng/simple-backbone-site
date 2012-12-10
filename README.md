This is just a test site to experiment the use of: 

- BackboneJS (with Marionette)
- Jade (HTML templating)
- Stylus (with Nib for CSS)
- RequireJS

All this done on client side

-------

A short how to: 

`index.jade`

	doctype 5
	html
		head
			title Simple Backbone
			link(rel="stylesheet", href="/css/app/styles.css")
			// RequireJS and init script
			script(src="/js/require.js", data-main="/js/app/init.js")
		body
			header#siteheader
				h1 Simple Backbone

			// a Marionette region
			section#main

			// templates go here
			include templates

`templates.jade`

For now everything in template need to be rendered as text. 
Not sure if its possible to somehow omit the `|`

	script(type="text/template", id="tmplMainView")
		| h1= title
		| p= content

	script(type="text/template", ...)
		...

`init.coffee`

	require.config
		baseUrl: "js"
		shim: 
			jquery: 
				exports: "jQuery"
			underscore: 
				exports: "_"
			backbone: 
				deps: ["underscore", "json2", "jquery"]
				exports: "Backbone"
			marionette: 
				deps: ["backbone"]
				exports: "Backbone.Marionette"
			jade:
				exports: "jade"

	require [
		"app/main"
	]

`main.coffee`

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
			
