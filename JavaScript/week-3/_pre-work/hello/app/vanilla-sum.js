// var number = prompt('please enter a number.');
// var otherNumber = prompt('enter antoher number');
// var sum = number + otherNumber;
// alert("The sum of your two numbers is: " + sum);

var findSum = function(first, second) {
  var sum = first + second;
  alert("The sum of your two numbers is: " + sum);
}

var number = parseInt(prompt('please enter a number.'));
var otherNumber = parseInt(prompt('enter another number.'));
findSum(number);
