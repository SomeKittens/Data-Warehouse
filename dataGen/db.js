'use strict';

var pg = require('pg')
  , bluebird = require('bluebird')
  , connString = process.env.PG_URL;

bluebird.promisifyAll(pg);
bluebird.promisifyAll(pg.Client.prototype);

module.exports = function(fn) {
  var close;
  return pg.connectAsync(connString).bind({}).spread(function(client, _close) {
    close = _close;
    return fn(client);
  }).finally(function() {
    if (close) {
      close();
    }
  });
};
