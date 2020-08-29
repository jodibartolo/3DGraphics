// 3D Scene Example
// merry go round
//Jodianne
float time = 0;  // keep track of the passing of time
 float b;
 PImage img;
int up;
int rat = 1;


// Draw a scene with a cylinder, a box and a sphere

// Draw a cylinder of a given radius, height and number of sides.
// The base is on the y=0 plane, and it extends vertically in the y direction.
void cylinder (float radius, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  // bottom end cap
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  // top end cap

  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    vertex (0.0, height, 0.0);
    endShape();
  }
  
  // main body of cylinder
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }
}

void cone (float radius, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];


  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  // bottom end cap
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;

    beginShape(TRIANGLES);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  // top end cap

  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);

    vertex (c[ii] * 1, height, s[ii] * 1);
    vertex (c[i] * 1, height, s[i] * 1);
    vertex (0.0, height, 0.0);
    endShape();
  }
  
  // main body of cylinder
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * 1, height, s[i] * 1);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * 1, height, s[ii] * 1);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }

}

void createMerry() {
  float c = 7.5;
pushMatrix();
rotateX(.05);
translate(0,9,0);

  for (int i = 0; i < 9; i++) {
    if (i== 1 || i==7 ) {
      b = -20;

    } else if (i ==2 || i == 6){
       b = 20;
      
    } else if (i == 3 || i == 5){
      b = -30;
 
    } else if (i == 4) {
      b = 25;
       
    } else {
      b = 0;
    }

    fill(55 + i*c, 20+ i*c, 10 + i * c);
       pushMatrix();
        // "fill" sets both diffuse and ambient color
  ambient (50, 50, 50);      // set ambient color
  specular (100, 150, 150);   // set specular color
  shininess (3.0);            // set specular exponent
  rotate (time, 0.0, .5, 0.0);      // rotate based on time
  translate (-30 + c, -17.0, b);

  cylinder (1.0, 35.0,21);
  
  translate(0,10 + i + up/3,0);
  scale(.5,.5,.5);
  fill(200,c,0);
  sphere(10);
  translate(7, -10,0);
  
  sphere(4.5);
  translate(-7,10,0);
  rotateZ(.5);
rotateX(1);
  cone(6.0, 20, 7);
  rotateX(-2);
  cone(6.0, 20, 7);
    rotateX(-1);
    cone(6.0, 20, 7);
  rotateX(4);
  cone(6.0, 20, 7);



  popMatrix();
  
  c+= 7;

  }
  pushMatrix();
  fill(220,90,30);
  translate(0, 17,-2);
   rotate (0, 0.0, .2, 0.0);


  box(75, 2, 75);
  popMatrix();
  
    pushMatrix();
      ambient (10, 50,50);
  fill(220,0,30);
  translate(0, -17,0);


rotateX(3.09);
    //pointLight(100,40,40,400,0,0);
      rotate (time, 0.0, .5, 0.0);  
  cone(46, 13, 20);
  popMatrix();

  popMatrix();
  

   up+=rat;
  if (up == 8 || up == -8) {
    rat*= -1;
  
  }
 
  
  
}
