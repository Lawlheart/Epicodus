/// <reference path="to-do-classes-interfaces.ts" />
/// <reference path="to-do-people.ts" />
/// <reference path="to-do-listing-functions.ts" />


var people = ToDoList.people;

var tasks: ToDoList.Task[] = [];

tasks.push(new ToDoList.HomeTask("Do the dishes.", "High"));
tasks.push(new ToDoList.HomeTask("Buy Groceries.", "Low", people.loki));
tasks.push(new ToDoList.HomeTask("Do the laundry.", "High"));

tasks.push(new ToDoList.HobbyTask("Practice Code."));
tasks.push(new ToDoList.HobbyTask("Bake a pie."));

var today = new Date();

var tomorrow = new Date();
tomorrow.setDate(today.getDate() + 1);

var nextDay = new Date();
nextDay.setDate(today.getDate() + 2);

console.log(today, tomorrow, nextDay);

tasks.push(new ToDoList.WorkTask(today, "Update blog.", "High", people.loki));
tasks.push(new ToDoList.WorkTask(tomorrow, "Go to meeting.", "Medium", people.thor));
tasks.push(new ToDoList.WorkTask(tomorrow, "Save the world.", "High", people.thor));
tasks.push(new ToDoList.WorkTask(tomorrow, "Buy a new shirt.", "Low", people.thor));
tasks.push(new ToDoList.WorkTask(nextDay, "Clean ceiling.", "Low", people.thor));

console.log(tasks);

var thorTasks = ToDoList.describeTasksForPerson(people.thor, tasks);
console.log("Here are Thor's tasks: ");
for(var taskDetail of thorTasks) {
  console.log(taskDetail);
}
