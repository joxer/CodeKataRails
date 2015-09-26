define(['views/base/view', ''], function(View, template) {
  'use strict';

  var SiteView = View.extend({
    container: 'body',

    regions: {
      main: '#main-container'
    },

  });

  return SiteView;
});
