//4. Write a dart program to create a class Camera with private properties [id, brand, color, prize].
// Create a getter and setter to get and set values.
// Also, create 3 objects of it and print all details.

class Camera {
  var _id;
  var _brand;
  var _color;
  var _prize;

  void setId(var id) => _id = id;
  void setBrand(var brand) => _brand = brand;
  void setColor(var color) => _color = color;
  void setPrize(var prize) => _prize = prize;

  int getId() => _id;
  String getBrand() => _brand;
  String getColor() => _color;
  int getPrize() => _prize;

}

void main(){
  
  var camera1 = Camera();
  camera1.setId(1);
  camera1.setBrand("Sony");
  camera1.setColor("Black");
  camera1.setPrize(100);

  print("Camera with id ${camera1.getId()}, of brand ${camera1.getBrand()}, color ${camera1.getColor()}, and prize ${camera1.getPrize()}.");

  var camera2 = Camera();
  camera2.setId(2);
  camera2.setBrand("Canon");
  camera2.setColor("White");
  camera2.setPrize(1000);

  print("Camera with id ${camera2.getId()}, of brand ${camera2.getBrand()}, color ${camera2.getColor()}, and prize ${camera2.getPrize()}.");

  var camera3 = Camera();
  camera3.setId(3);
  camera3.setBrand("Nikon");
  camera3.setColor("Grey");
  camera3.setPrize(300);

  print("Camera with id ${camera3.getId()}, of brand ${camera3.getBrand()}, color ${camera3.getColor()}, and prize ${camera3.getPrize()}.");


}
