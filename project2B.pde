//MY mice are being instanced :))) (object oriented programming) 
//car drives in scene 4
// make sign 
// abandoned amusement park
//camera looks at sign
//then follows mice as they run up to the merry go round

import beads.*;
import controlP5.*;
public mouse[] mice;
public mouse[] mice2;
public fence f;
PShape floor;
ControlP5 p5;
Button start;
Gain levels;
PImage imag; 
PImage sky;
PImage graf; 
PShape signs;
SamplePlayer music;
int closer;
int move;
int scene;
int timeMove;
public car c;

boolean okay = false;
void setup() {
  size(1000, 800, P3D);  // must use 3D here!
  noStroke(); 
    ac = new AudioContext();
    p5 = new ControlP5(this);
    levels = new Gain(ac, 1, 3);
     music = getSamplePlayer("windows.wav", true);
     levels.addInput(music);
     ac.out.addInput(levels);
  mice = new mouse[16];
   mice2 = new mouse[16];
   f = new fence(25);
   c = new car();
  int d = 0;
  for (int i = 0; i < mice.length; i++) {
    mice[i] = new mouse(80, -300 + d);
    mice2[i] = new mouse(80, 90 - d);
    d+= 30;
  }
  closer = 1;
  imag = loadImage("concrete.jpg");
   graf= loadImage("grafiti.jpg");
   sky = loadImage("sky.jpg");
  floor = createShape(BOX,1000,3,800);
   signs = createShape(BOX,60,30,10);
  floor.setTexture(imag);
  signs.setTexture(graf);
  // do not draw the edges of polygons
  
p5.addButton("start")
    .setPosition(width/2, height/2)
    .setSize(80, 50)
    .setColorBackground(color(50,50,200))
    .activateBy((ControlP5.RELEASE))
    .setLabel("Start Animation");
    scene = 0;
    
    music.pause(false);
    
     ac.start();
}

void draw() {
   background(0);
  if (scene!= 0) {
  resetMatrix();  // set the transformation matrix to the identity (important!)

   // clear the screen to white

  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);

  // place the camera in the scene
  switch(scene) {
   
    case 1:
    background(sky); 
      camera (-60, -40.0 - timeMove/2 , 330.0 , 60.0, 0.0, -1.0, 0.0, 1.0, 0.0);
    
    break;
    case 2:
    background(sky); 
      camera (-60 + timeMove/3, 0.0, 100.0 , 60.0 - timeMove/3, 0.0, -1.0, 0.0, 1.0, 0.0);
    
    break;
    case 3:
    background(sky); 
     camera (0, -50.0, -100.0 , 60.0, 0.0, -1.0, 0.0, 1.0, 0.0);
    case 4:
    background(sky); 
       camera (80, 0.0,1300- timeMove , 90.0, -30.0, 500.0  , 0.0, 1.0, 0.0);

     pointLight(80, 102, 126, 80, 0, 1300-timeMove);
    break;
    

    
  }
 

 if (scene != 0) { 
  // create an ambient light source
  ambientLight (90, 90, 90);

  //// create two directional light sources
  lightSpecular (44, 44, 44);
 
  directionalLight (52, 92, 92, 20, 180, -70);
 pointLight(50, 102, 126, 100, -100, 200);

  time += 0.005;
  createMerry();
  
  concrete();

  for (int i = 0; i < mice.length; i++) {
    mice[i].drawMouse();
    if(okay){
    mice2[i].drawMouse();
    }

  }
    if (scene != 4) {
//each mouse needs to stay in certain confines 
   for (int i = 0; i < mice.length; i++) {
    float a = random(-5, 5);
    mice[i].update(a);
    if(okay) {
        mice2[i].update(a);
   }
   }
}
closer++;
sign();
//path();
f.drawFence();
timeChange();
  if (scene ==3 || scene == 4) {
    c.drawShip();
    c.updateCar();
  }
 }
  }


}
void timeChange() {

  timeMove++;
  
  
  if(timeMove == 300) {
    scene = 2;
    okay = true;
    
  }
  if (timeMove == 1000) {
    scene = 3;
  } if (timeMove == 1200) {
    scene =4; 
  } if (timeMove == 1600) {
    
    scene = 0;
    ac.stop(); 
  }

  
  
}


void concrete(){
  fill(0,10,0);
  pushMatrix();

    //beginShape();
   translate(0, 30,0);
  rotateX(.084);
 
  shape(floor,0,0);
  //cube();

  popMatrix();

  
  
}


void sign() {
  fill(0);
  ambient(0);
  pushMatrix();
  translate(20,0,0);
  pushMatrix();
  rotateY(2);
  translate(-25,-30,250);
  //box(60,30,10);
    shape(signs, 0,0);
  translate(-20,10,0);
  cylinder(2,60,70);
  translate(40, 0,0);
    cylinder(2,60,70);
  
  
  popMatrix();
   
     pushMatrix();

  translate(-25,-30,250);
  //box(60,30,10);
  shape(signs, 0,0);
  translate(-20,10,0);
  cylinder(2,40,70);
  translate(40, 0,0);
    cylinder(2,40,70);
      rotateY(4);
  
  
  popMatrix();
  popMatrix();
}

void start(){
  scene = 1;
  
}
