$(document).ready(function(){
  $('#griffin-form').submit(function() {
    var length = $('#length').val();
    var width = $('#width').val();
    var height = $('#height').val();
    var weight = $('#weight').val();
    var shippingFrom = $('#shipping-from').val();
    var shippingTo = $('#shipping-to').val();

    if (length == '', width == '', height == '', weight == '') {
      $("#message").text("Enter Valid Dimensions Please.")
      event.preventDefault();
    } else if(shippingFrom == '' || shippingTo == '') {
      $("#message").text("Enter Valid Locations Please.")
      event.preventDefault();
    }

  });
});
