public class mouse{
  
  int size;
  int location;
  int a;
  float change;
  mouse(int s, int l) {   
    size = s;
    location = l;  
  }
  
  void drawMouse() {
    pushMatrix();
    rotateX(.08);
    translate(location + change,16,0);
    fill(100,30,0);
    pushMatrix();
  scale(.3);
   translate(0,20,-400 +a/2);
    sphere(9);

    translate(-3,-9,1);
    rotateX(9);   
    cone(3,4,6);
    translate(6,0,0);
    cone(3,4,6);
    popMatrix();  
    pushMatrix();
    scale(.3);
    fill(200,0,0);
    translate(0,20,-393 +a/2);
    sphere(2.75);
    translate(4,0,-1);
    sphere(2.75);
    popMatrix();
    fill(100,30,0);
    pushMatrix();
    scale(.3);
    translate(0,24,-420 + a/2);
    rotateX(8);
    cylinder(7.5,20,30);
    popMatrix();
    //rotateY(90);
    //pushMatrix();
    ////scale(.5);
    //translate(0,18,-290 + a/2);
 
    //cylinder(1,8,10);
    //popMatrix(); 

    popMatrix();

  }
  
 
  void update(float c) {
    a++;
    if (a % 9 == 0 ) {
       change = c;
    }   
    
  }
   
}
