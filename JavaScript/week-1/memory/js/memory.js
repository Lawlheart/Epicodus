function Card(symbol, cardColor) {
  this.symbol = symbol;
  this.cardColor = cardColor;
  this.faceUp = false;
}

Card.prototype.flip = function () {
  this.faceUp = !this.faceUp;
};

exports.Card = Card;
