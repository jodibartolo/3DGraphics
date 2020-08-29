public class fence {
  int lengthF;
  
  fence(int l){
    lengthF = l;
  }
  
  void drawFence(){
    int a = 0;
    fill(150,80,10);

   
    for(int i = 0; i < lengthF; i++) {
          pushMatrix();
         translate(-350 + a,42,-360);
      //cylinder(2,20,15);
      rotateZ(.5);
       cylinder(2,20,15);

  translate(-2,0,0);
  rotateZ(-1);
    cylinder(2,20,15);
      a+= 30;
          popMatrix(); 
    }

    
  }
  
  
}
