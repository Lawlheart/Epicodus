var Calculator = require('./../js/pingpong.js').calculatorModule;

$(document).ready(function() {
  $('select').material_select();
  $('#ping-pong-form').submit(function(event) {
    event.preventDefault();
    var goal = $('#goal').val();
    var simpleCalculator = new Calculator("hot pink");
    var output = simpleCalculator.pingPong(goal);
    $('#solution').append("<li>Ping Pong for " + goal + ":</li>");
    output.forEach(function(element) {
      $('#solution').append("<li>" + element + "</li>");
    });
  });

  $('#math-form').submit(function(event) {
    event.preventDefault();
    var simpleCalculator = new Calculator("hot pink");
    var num1 = parseInt($('#num1').val());
    var num2 = parseInt($('#num2').val());
    var operator = $('#operator').val();
    var output = simpleCalculator[operator](num1, num2);
    $('#solution').append(`<li>${operator} ${num1} and ${num2}:</li>`);
    $('#solution').append("<li>" + output + "</li>");
  })
});
