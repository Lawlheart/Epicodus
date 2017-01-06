var moment = require('./../bower_components/moment/moment.js');

function pad(num) {
  if(num < 10) {
    return "0" + num;
  } else {
    return num;
  }
}

function Alarm() {
  this.time = null;
}

Alarm.prototype.setTime = function(time) {
  var time = moment(time, "HH:mm");
  if(time < moment()) {
    time.add(1, "days");
  }
  return this.time = time;
};

Alarm.prototype.getTime = function () {
  var suffix, hour;
  if(this.time.hour() > 12) {
    suffix = "PM";
    hour = this.time.hour() - 12;
  } else {
    suffix = "AM";
    hour = this.time.hour();
  }
  return `${hour}:${pad(this.time.minute())} ${suffix}`
};

exports.Alarm = Alarm;
