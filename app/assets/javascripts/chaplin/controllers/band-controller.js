define([
  'controllers/base/controller',
    'models/band',
      'models/band-collection',
  'views/band-view'
], function(Controller, Band, Bands, BandView) {
  'use strict';

  var BandController = Controller.extend({
      show: function(params) {
	  this.bands = new Bands();

	  this.bands.fetch().success(function(data){
	      this.view = new BandView(this.bands);
	  })


    }
  });

  return BandController;
});
