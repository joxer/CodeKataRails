define([
  'controllers/base/controller',
  'models/login',
  'views/LoginView'
], function(Controller, Login, LoginView) {
  'use strict';

  var LoginController = Controller.extend({
      show: function(params) {

	  this.view = new HelloWorldView({

	  });
    }
  });

  return HelloWorldController;
});
