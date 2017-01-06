var chai = require('chai');
var expect = chai.expect;
var moment = require('./../bower_components/moment/moment.js');
var Alarm = require('./../js/alarm.js').Alarm;


describe('Alarm', function() {
  it('initialize the alarm to null', function() {
    var alarm  = new Alarm();
    expect(alarm.time).to.equal(null);
  });
  describe('#setTime', function() {
    it('should set #time to the time specified', function() {
      var alarm  = new Alarm();
      alarm.setTime("05:30");
      expect(alarm.time.hour()).to.equal(5);
      expect(alarm.time.minute()).to.equal(30);
    });
    it('should set the time for tomorrow if that time has already passed', function() {
      var alarm  = new Alarm();
      alarm.setTime("1:01");
      var tomorrow = moment().add(1, 'days');
      expect(alarm.time.date()).to.equal(tomorrow.date());
    })
  });
  describe('#getTime', function() {
    it('return the alarm time, formatted as HH:MM', function() {
      var alarm  = new Alarm();
      alarm.setTime("1:01");
      expect(alarm.getTime()).to.equal("1:01 AM");
    });
    it('should return PM suffix for afternoon hours', function() {
      var alarm  = new Alarm();
      alarm.setTime("14:30");
      expect(alarm.getTime()).to.equal("2:30 PM");
    })
  });
});
