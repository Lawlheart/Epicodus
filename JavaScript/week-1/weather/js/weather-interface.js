// var weather = require('./../js/weather.js');
var weatherKey = require('./../.env').weatherKey;

$(document).ready(function() {
  $("#weatherLocation").click(function() {
    var city = $('#location').val();
    $('#location').val("");
    $('.showWeather').text('your chosen city is: ' + city + ".");
    $.get('http://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=' + weatherKey, function(response) {
      $('.showWeather').text("the humidity in " + city + " is " + response.main.humidity + "%");
    });
  });
});
