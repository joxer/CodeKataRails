define([
  'controllers/base/controller',
  'models/login',
  'views/band-view'
], function(Controller, Concert, ConcertView) {
  'use strict';

  var ConcertController = Controller.extend({
      show: function(params) {

	  this.view = new ConcertView({
	      
	  });
    }
  });

  return ConcertController;
});
