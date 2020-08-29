public class car{
  int a;
  int t;
  
  car() {
    
    
  }
  
  //draws the car
  void drawShip(){

    fill(20 + t ,0,0);
    ambient(20);
    pushMatrix();

    translate(90,-3,400 - a);
        rotateZ(219.95);
        rotateX(0.15);
    //bottom part of car
    box(25,8,40);
    translate(0,-6,0);
    fill(200 - t,0,100);
    //top part of car
    box(15,5,20);

    popMatrix();
  
  }
  
  void updateCar(){    
    //updates z position 
    a++;
    t++; 
    
  }
  
  
}
