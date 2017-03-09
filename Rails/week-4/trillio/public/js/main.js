$("body").on('click', '.add-btn', function(e) {
  var numbers = [];
  if($("#message_to").val() !== "") numbers = $("#message_to").val().split(", ");
  var newNumber = $(e.target).attr('data-contact-number');

  if(numbers.indexOf(newNumber) < 0) {
    numbers.push(newNumber);
    $(e.target).html("-")
  } else {
    numbers = numbers.filter(function(num) {
      return num != newNumber;
    })
    $(e.target).html("+")
  }
  $("#message_to").val(numbers.join(", "))
});
