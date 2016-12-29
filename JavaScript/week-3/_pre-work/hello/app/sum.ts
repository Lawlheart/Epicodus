var findSum = function(first :number, second :number) {
  var sum = first + second;
  alert("The sum of your two numbers is: " + sum);
}


var number :number;
var otherNumber :number;

number = parseInt(prompt('please enter a number.'));
otherNumber = parseInt(prompt('please enter another number'));
findSum(number, otherNumber);
