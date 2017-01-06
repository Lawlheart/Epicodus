(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
exports.apiKey = 'b97c6aedcbc8ca8319c414894ae7f918';
},{}],2:[function(require,module,exports){
var apiKey = require('./../.env').apiKey;

function Doctor(data) {
  this.profile = data.profile;
  this.data = data;
}

exports.getDoctors = function(medicalIssue, cb) {
  $.get('https://api.betterdoctor.com/2016-03-01/doctors?query='+ medicalIssue+'&location=45.5231%2C-122.6765%2C%205&user_location=45.5231%2C-122.6765&skip=0&limit=20&user_key=' + apiKey)
  .then(function(result) {
    console.log(result);
    cb(result);
  })
  .fail(function(error){
    console.log("fail");
    cb(false);
  });
};

exports.Doctor = Doctor;
},{"./../.env":1}],3:[function(require,module,exports){
var Doctor = require('./../js/doctor').Doctor;
var getDoctors = require('./../js/doctor').getDoctors;


function DoctorCard(doctor) {
  return $(`
        <div class="card blue darken-2 doctor-card">
          <div class="card-content">
            <span class="card-title">${doctor.profile.first_name} ${doctor.profile.last_name}</span>
            <div class="profile">
              <img src="${doctor.profile.image_url}" alt="${doctor.profile.last_name}'s profile image">
            </div>
            <p class="bio">${doctor.profile.bio}</p>
          </div>
        </div>
      `);
}


$(document).ready(function() {

});

$('#doctor-search').submit(function(e) {
  e.preventDefault();
  $('#doctors').html("");
  var symptom = $('#symptom').val();
  getDoctors(symptom, function(results) {
    if(!results) return false;

    for(var i=0; i<results.data.length; i++) {
      var doctor = new Doctor(results.data[i]);
      $('#doctors').append(DoctorCard(doctor));
    }
  });
});
},{"./../js/doctor":2}]},{},[3]);
