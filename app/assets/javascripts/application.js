// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bower_components/requirejs/require.js

  // Configure the AMD module loader
  requirejs.config({
    // The path where your JavaScripts are located
    baseUrl: 'assets/chaplin',
    // Specify the paths of vendor libraries
    paths: {
	jquery: '../bower_components/jquery/jquery',
	underscore: '../bower_components/lodash/dist/lodash',
	backbone: '../bower_components/backbone/backbone',
	handlebars: '../bower_components/handlebars/handlebars',
	text: '../bower_components/requirejs-text/text',
	chaplin: '../bower_components/chaplin/chaplin',
	jqueryui: '../bower_components/jquery/jqueryui'
    },
    // Underscore and Backbone are not AMD-capable per default,
    // so we need to use the AMD wrapping of RequireJS
    shim: {
      underscore: {
        exports: '_'
      },
      backbone: {
          deps: ['underscore', 'jquery', 'jqueryui'],
          exports: 'Backbone'
      },
	handlebars: {
            exports: 'Handlebars'
	}
    }
    // For easier development, disable browser caching
    // Of course, this should be removed in a production environment
    //, urlArgs: 'bust=' +  (new Date()).getTime()
  });

  // Bootstrap the application
  require(['application', 'routes'], function(Application, routes) {
      window.application = new Application({routes: routes, controllerSuffix: '-controller'});
  });
