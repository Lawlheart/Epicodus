(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
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

},{}],2:[function(require,module,exports){
var Entry = require('./../js/journal.js').Entry;

$(document).ready(function() {
  $('#new-entry-form').submit(function(event) {
    event.preventDefault();
    var title = $('#title').val();
    var body = $('#body').val();
    var entry = new Entry(title, body);
    $('#journal').append(`
      <div class="card cyan white-text">
        <div class="card-content">
          <span class="card-title">${entry.title}</span>
          <p>${entry.body}</p>
          <h6 class="label cyan-text text-darken-4">Meta Details</h6>
          <p>Vowels: ${entry.vowels()}</p>
          <p>Consonants: ${entry.consonants()}</p>
          <p>Teaser: ${entry.getTeaser()}</p>
        </div>
      </div>`);
      $('#title').val("");
      $('#body').val("");
  });

});

},{"./../js/journal.js":1}]},{},[2]);
