define(function() {
  'use strict';

  // The routes for the application. This module returns a function.
  // `match` is match method of the Router
  return function(match) {
      match('login', 'login#show');
      match('bands', 'band#show');
      match('concerts', 'concert#show');
  };
});
