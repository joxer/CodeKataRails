define([
  'controllers/base/controller',
    'models/band',
      'models/band-collection',
  'views/band-view'
], function(Controller, Band, Bands, BandView) {
  'use strict';

  var BandController = Controller.extend({
      show: function(params) {
	  var bands = new Bands();

	  bands.fetch().success(function(data){
	      console.log(data)
	  })
	  
	  this.view = new BandView({
	      
	  });
    }
  });

  return BandController;
});
