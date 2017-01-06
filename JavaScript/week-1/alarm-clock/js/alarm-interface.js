var Alarm = require('./../js/alarm.js').Alarm;

$(document).ready(function(){
  var alarms = [];
  var interval = setInterval(function() {
    $('#time').text(moment());
  }, 1000);


});

$('#new-alarm').submit(function(event) {
  event.preventDefault();
  var newAlarm = new Alarm();
  var newAlarmTimeInput = $('#new-alarm-time').val();
  // newAlarm.setTime("4:30")
  newAlarm.setTime(newAlarmTimeInput);

  $('#alarms').append($('<p></p>').text(newAlarm.getTime()));
  $('#new-alarm-time').val("");
});
