function Entry(title, body) {
  this.title = title;
  this.body = body;
}

Entry.prototype.vowels = function () {
  return this.body.split("").filter(function(letter) {
    var vowels = ['a', 'e', 'i', 'o', 'u'];
    return vowels.indexOf(letter) >= 0
  }).length
};

Entry.prototype.consonants = function () {
  return this.body.length - this.vowels();
};

Entry.prototype.getTeaser = function () {
  var words = this.body.split(" ");
  var output = words.slice(0, 8).join(" ");
  if(words.length > 8) {
    output += "...";
  }
  return output;
};

exports.Entry = Entry;
