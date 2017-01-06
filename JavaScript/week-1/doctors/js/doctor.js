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