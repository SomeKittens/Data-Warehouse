'use strict';

require('dotenv').load();

var getDB = require('./db')
  , faker = require('faker')
  , bluebird = require('bluebird');

// Used for weighted things
Array.prototype.random = function () {
  return this[Math.floor(Math.random() * this.length)];
};

var randBetween = function (low, high) {
  var interval = high - low;
  return Math.round(Math.random() * interval) + low;
};

getDB(function (db) {
  var numTicketsSold = randBetween(1000, 5000)
    , customerTimes = [];

  var createCustomer = function (entryTime) {
    var purchase;
    var paymentId = [1,1,1,1,1,2,2,2,3,3,4].random();
    var id;
    var isChild = Math.random() < 0.40;
    return db.queryAsync('INSERT INTO customers (customerName, paymentId, hasNewsletter) VALUES ($1, $2, $3) RETURNING id', [
      faker.name.findName(),
      paymentId,
      Math.random() < 0.1
    ])
    .bind({}).get('rows').get(0).get('id').then(function (_id) {
      id = _id;
      purchase = function (productId, storeId, time) {
        return db.queryAsync('INSERT INTO purchases (customerId, paymentId, productId, storeId, timeOfPurchase) VALUES ($1, $2, $3, $4, $5)', [
          id,
          paymentId,
          productId,
          storeId,
          time
        ]);
      };

      // 7 is day ticket adult
      // 9 is child
      var ticketId = isChild ? 7 : 9;

      return purchase(
        ticketId,
        5, // Front gate
        entryTime
      );
    })
    .then(function () {
      var concessionPromises = []
        , vendor, time, app;

      var buy = function (chance, itemId) {
        if (Math.random() < chance) {
          concessionPromises.push(purchase(itemId, vendor, time));
        }
      };
      var switchPayment = function () {
        paymentId = [3,4,4].random();
        concessionPromises.push(
          db.queryAsync('UPDATE customers SET paymentId = $1 WHERE id = $2', [paymentId, id])
        );
      };
      // iOS adds 15% chance, Android 7
      if (paymentId === 3) {
        app = 0.15;
      } else if (paymentId === 4) {
        app = 0.07;
      } else {
        app = 0;
      }

      // 75% chance they picked up some food
      if (Math.random() < 0.75 + app) {
        vendor = [1,1,2,2,3,3,3,4].random();
        if (vendor === 1 && paymentId < 3 && Math.random() < 0.8) {
          // TODO properly model change of payment type
          paymentId = randBetween(3, 4);
        }
        if (Math.random() < 0.6) {
          time = randBetween(11, 3) + ':' + randBetween(0, 59) + ':' + randBetween(0, 59);
        } else {
          time = randBetween(9, 18) + ':' + randBetween(0, 59) + ':' + randBetween(0, 59);
        }
        // Drink
        buy(0.8, 3);
        // Cotton candy
        var ccChance = isChild ? 0.33 : 0.66;
        buy(ccChance, 1);
        // Pretzel
        var pChance = isChild ? 0.66 : 0.15;
        buy(pChance, 2);
      }

      // 45% chance they grabbed a souvenir
      if (Math.random() < 0.45 + app) {
        vendor = [1,2,2,3,3,3,3,4,4,4,4].random();
        if (vendor === 1 && paymentId < 3 && Math.random() < 0.8) {
          paymentId = randBetween(3, 4);
        }
        time = randBetween(9, 18) + ':' + randBetween(0, 59) + ':' + randBetween(0, 59);
        buy(0.33, 4);
        buy(0.33, 5);
        buy(0.33, 6);
      }

      // Season pass
      if (Math.random() < 0.10 + app / 2) {
        vendor = [1,2,3,3,3,4,4].random();
        time = randBetween(9, 18) + ':' + randBetween(0, 59) + ':' + randBetween(0, 59);
        buy(1, 8);
      }

      return bluebird.all(concessionPromises);
    });
  };

  // Most people show up early, then trickle in
  for (var i = 0; i < numTicketsSold; i++) {
    var minutes = randBetween(0, 59);
    var seconds = randBetween(0, 59);
    if (Math.random() > 0.6) {
      customerTimes.push(bluebird.resolve('9:' + minutes + ':' + seconds));
    } else {
      // 24hr time
      var hour = randBetween(10, 18);
      customerTimes.push(bluebird.resolve(hour + ':' + minutes + ':' + seconds));
    }
  }
  return bluebird.each(customerTimes, createCustomer);
}).tap(process.exit);