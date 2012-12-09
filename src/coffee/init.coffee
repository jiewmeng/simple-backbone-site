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
		"backbone.marionette": 
			deps: ["backbone"]
			exports: ["Backbone.Marionette"]

require [
	"app/main"
]