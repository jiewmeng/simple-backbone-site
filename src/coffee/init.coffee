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