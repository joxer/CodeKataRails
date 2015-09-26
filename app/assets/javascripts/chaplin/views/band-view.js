define([
    'views/base/view',
    ''
], function(View, template) {
    'use strict';

    var ConcertView = View.extend({
	// Automatically render after initialize
	autoRender: true,

	initialize: function(){
	}
	
    });

    return ConcertView;
});
