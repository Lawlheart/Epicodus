/// <reference path="to-do-classes-interfaces.ts" />

module ToDoList {
  export let describeTasksForPerson = function(assignee: IPerson, taskCollection: Task[]): String[] {
    let descriptions: String[] = [];
    for(let task of taskCollection) {
      if(task.assignedTo === assignee) {
        descriptions.push(task.description);
      }
    }
    return descriptions;
  }
}
