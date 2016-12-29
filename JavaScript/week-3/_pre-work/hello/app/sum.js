var findSum = function (first, second) {
    var sum = first + second;
    alert("The sum of your two numbers is: " + sum);
};
var number;
var otherNumber;
number = parseInt(prompt('please enter a number.'));
otherNumber = parseInt(prompt('please enter another number'));
findSum(number, otherNumber);
