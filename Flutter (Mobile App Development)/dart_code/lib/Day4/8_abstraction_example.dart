// April 7, 2023


abstract class Shape{
  double area();
}


class Circle extends Shape{

  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 2.14 * radius;
  }

}

class Rectangle extends Shape{

  double length;
  double breadth;

  Rectangle(this.length, this.breadth);

  @override
  double area() {
    return length * breadth;
  }
}


void main(){
  
  var circleObj = Circle(100);
  print("Area of circle is : ${circleObj.area()}");


  var rectangleObj = Rectangle(10, 10);
  print("Area of circle is : ${rectangleObj.area()}");
}




