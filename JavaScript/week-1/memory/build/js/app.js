(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
function Card(symbol, cardColor) {
  this.symbol = symbol;
  this.cardColor = cardColor;
  this.faceUp = false;
}

Card.prototype.flip = function () {
  this.faceUp = !this.faceUp;
};

exports.Card = Card;

},{}],2:[function(require,module,exports){
// red:     empire
// orange:  coffee
// yellow:  hourglass
// green:   tree
// blue:    rebel
// purple:  bomb

var Card = require('./../js/memory.js').Card;
var guesses, cards;

function getRandomCards(numPairs) {
  var cards = [];
  var colors = ['red', 'orange', 'yellow', 'green', 'blue', 'purple'];
  var symbols = ['empire', 'coffee', 'hourglass', 'tree', 'rebel', 'bomb'];
  for(var i=0; i<numPairs; i++) {
    cards.push(new Card(symbols[i], colors[i]));
    cards.push(new Card(symbols[i], colors[i]));
  }
  // TODO: Randomize them
  return cards;
}

$(document).ready(function() {
  guesses = [];
  cards = getRandomCards(6);
  for(var i=0; i<cards.length; i++) {
    var card = cards[i];
    $('#game-board').append(`
      <div class="card game-card ${card.cardColor} face-down" meta-symbol="${card.symbol}">
        <div class="card-content">
          <i class="fa fa-${card.symbol}"></i>
        </div>
      </div>
    `);
  }
});

$('body').on('click', '.game-card', function(event) {
  event.preventDefault();
  var $card = $(event.target.closest('.game-card'));
  $card.toggleClass('face-down');
  var symbol = $card.attr('meta-symbol');
  if(guesses.indexOf(symbol) < 0) {
    guesses.push(symbol);
  } else {
    console.log("YOU WIN");
  }
  console.log(guesses);

})

},{"./../js/memory.js":1}]},{},[2]);
