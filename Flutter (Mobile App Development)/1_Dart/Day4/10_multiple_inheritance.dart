// June 7, 2023


abstract class User{
  void login();
  void register();
}


abstract class Customer{
  void viewProduct();
  void buyProduct(); 
}

abstract class Admin{
  void addUsers();
  void viewUsers();
}



//Multiple inheritance: from User and Customer.
class newCustomer implements User,Customer{

  String name;

  newCustomer(this.name);

  @override
  void buyProduct() {
    print("Buying product.");
  }

  @override
  void login() {
    print("Logging in.");
  }

  @override
  void register() {
    print("Registered.");
  }

  @override
  void viewProduct() {
    print("Viewing product");
  }

}


//Multiple inheritance: from User and Admin.

class newAdmin implements User, Admin{

  String name;

  newAdmin(this.name);

  @override
  void addUsers(){
    print("Adding users by $name");
  }

  @override
  void viewUsers(){
    print("Viewing users.");

  }

  @override
  void login() {
    print("Logging in.");
  }

  @override
  void register() {
    print("Registered.");
  }

}





void main(){

  var newCustomerObj = newCustomer("Someone");
  newCustomerObj.login();
  newCustomerObj.viewProduct();
  newCustomerObj.buyProduct();


  var newAdminObj = newAdmin("New Admin");
  newAdminObj.register();
  newAdminObj.login();
  newAdminObj.addUsers();

}



