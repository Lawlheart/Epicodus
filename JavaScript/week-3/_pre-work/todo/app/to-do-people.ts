/// <reference path="to-do-classes-interfaces.ts" />
module ToDoList {
  let diane: ToDoList.IPerson = {
   name: "Diane D",
   email: "diane@epicodus.com"
  };
  let thor: ToDoList.IPerson = {
    name: "Thor Son of Odin",
    email: "thor@asgard.com"
  };

  let loki: ToDoList.IPerson = {
    name: "God of mischief",
    email: "loki@geocities.com",
    phone: "555-666-7777"
  };

  export let people = {
    "diane": diane,
    "thor": thor,
    "loki": loki
  };
}
