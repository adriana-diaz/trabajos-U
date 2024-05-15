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