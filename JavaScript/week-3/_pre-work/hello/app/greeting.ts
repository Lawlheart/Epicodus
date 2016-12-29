class Greeter {
  constructor(public message:string) {}
  greet() {
    return "Hello, " + this.message;
  }
}




var greeters:Greeter[] = [];
greeters.push(new Greeter("world"));
greeters.push(new Greeter("how are you?"));
greeters.push(new Greeter("my baby, hello my honey, hello my ragtime gal!"));
console.log(greeters);

for(var greeter of greeters) {
  alert(greeter.greet());
}
