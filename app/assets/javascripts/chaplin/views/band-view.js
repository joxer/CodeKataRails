define([
    'views/base/view',
    'text!templates/bands.hbs'
], function(View, template) {
    'use strict';

    var BandView = View.extend({
		
	initialize: function(bands){
	    this.bands = bands;

	    this.template = _.template($(template).html())
	    $("body").append(this.template({
		collection: bands
	    }));
	},
	show: function(){
	    var self = this;
	    $( "#dialog" ).dialog({modal: true});
	}
	
    });

    return BandView;
});
