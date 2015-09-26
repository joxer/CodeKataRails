define([
  'controllers/base/controller',
  'models/login',
  'views/band-view'
], function(Controller, Concert, ConcertView) {
  'use strict';

  var ConcertController = Controller.extend({
      show: function(params) {

	  alert(1)
	  this.view = new ConcertView({
	      
	  });
    }
  });

  return ConcertController;
});
