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