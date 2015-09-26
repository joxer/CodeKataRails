define([
  'controllers/base/controller',
  'models/login',
  'views/band-view'
], function(Controller, Band, BandView) {
  'use strict';

  var BandController = Controller.extend({
      show: function(params) {

	  alert(1)
	  this.view = new BandView({
	      
	  });
    }
  });

  return BandController;
});
