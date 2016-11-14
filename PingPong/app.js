function pingPong() {
  var number = $("#pingPong").val();
  var $list = $("<ul></ul>");
  for(var i=1; i<=number; i++) {
    var output;
    if(i % 5 === 0 && i % 3 === 0) {
      output = 'pingpong';
    } else if(i % 3 === 0) {
      output = 'ping';
    } else if(i % 5 === 0) {
      output = 'pong';
    } else {
      output = i;
    }
    $list.append("<li>" + output + "</li>")
  }
  $("#output").html($list);
}