define([
  'models/base/model'
], function(Model) {
  'use strict';

  var User = Model.extend({

      url: "/user/login",
      
      default: {
	  
      }
      
  });

  return User;
});
