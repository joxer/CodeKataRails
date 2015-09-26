define([
  'chaplin',
  'models/base/model'
], function(Chaplin, Model) {
  'use strict';

    var band = Model.extend({

	url: "/bands",
	
    defaults: {
	
    }

    // ,initialize: function(attributes, options) {
    //  Model.prototype.initialize.apply(this, arguments);
    //  console.debug('HelloWorld#initialize');
    // }
  });

  return band;
});
