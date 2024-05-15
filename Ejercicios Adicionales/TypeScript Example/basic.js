//1. Install node.js 
//https://nodejs.org/en/download
//2. Check the Current Node Package Manager (npm)
//node -v
//npm -v
// 3. Install an npm Package Globally
//npm install -g typescript


var Customer = /** @class */ (function () {
    function Customer(name) {
        this.name = name;
    }
    Customer.prototype.announce = function () {
        return "Hello, my name is " + this.name;
    };
    return Customer;
}());
// create a new instance
var firstCustomer = new Customer("Adriana");
var newMessage = firstCustomer.announce();
// change the text on the page
var webHeading = document.querySelector('h1');
webHeading.textContent = newMessage;
