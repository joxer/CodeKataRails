
define([
  'controllers/base/controller',
  'models/login',
    'views/login-view',
    'models/user',
], function(Controller, Login, LoginView,User) {
  'use strict';

    var LoginController = Controller.extend({

      initialize: function(){
	  Controller.user = new User();
	  $("#login-button").on("click",this.show);

      },
	
	show: function(params) {

	    this.view = new LoginView(
		Controller.user
	    );
	    this.view.show();
    }
  });

  return LoginController;
});
