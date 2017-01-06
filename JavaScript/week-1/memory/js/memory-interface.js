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
