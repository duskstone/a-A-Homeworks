// function titlelize(names, callBack){
//     let titled = names.map(name => {
//         "Mx. " + `${name}` + " Jingleheimer Schmidt"
//     });

//     titled.forEach(sentence =>{
//         return console.log(sentence);
//     }) my attempt
// }

// Correct action 
function titleize(names, callBack) {
    let titlelized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callBack(titlelized);
};

// too properlery invoke the function we will be passing
// in the callback as a block of code
titleize(["Mary", "Brian", "Leo"], (names) => {
    names.forEach(name => console.log(name));
});

// Part 2 Constructor
function elephant(name, height, tricks){
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function(){
    return console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

// Elephant.prototype.grow = function() {
//     return this.height + 12;
// };
// initial code 

Elephant.prototype.grow = function() {
    this.height = this.height + 12
};
 
//tricks is an array so we can use array functions on it
Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.paradeHelper = function (elephant) {
    console.log(`${elephant.name} is trotting by!`);
};

function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);

    return function (food) {
        order = `${order.slice(0, order.length - 8)} and ${food} please.`;
        console.log(order);
    };
};
