PImage Linkimage;
PImage Linkrun;
PImage Linkrun2;
 
Link myLink;
 
void setup() {
 size(800, 800);
 smooth();
 noStroke();
 Linkimage = loadImage("linkmarche.png");
 Linkrun = loadImage("linkcours.png");
 Linkrun2 = loadImage("linkcours.png");
 myLink = new Link(0,575);
}
 
void draw() {
  background(255);  
  myLink.move();
  myLink.display();
}
 
//KEYBOARD INPUT
 
void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       myLink.moveLeft = true;
       Linkimage = loadImage("linkcoursgauche.png");
       Linkimage.resize(60,60);
 
     } else if(keyCode == RIGHT) {
       myLink.moveRight = true;
       Linkimage = loadImage("linkcours.png");
       Linkimage.resize(60,60);
     } else if(keyCode == UP) {
       Linkimage = loadImage("linkmarchehaut.png");
       Linkimage.resize(60,60);
       myLink.moveUp = true;
      } else if(keyCode == DOWN) {
       Linkimage = loadImage("linkcoursbas.png");
       Linkimage.resize(60,60);
       myLink.moveDown = true;
     }
  }
}
 
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       myLink.moveLeft = false;
       Linkimage = loadImage("linkmarchegauche.png");
       Linkimage.resize(60,60);
     } else if(keyCode == RIGHT) {
       myLink.moveRight = false;
       Linkimage = loadImage("linkmarche.png");
       Linkimage.resize(60,60);
     } else if(keyCode == UP) {
       Linkimage = loadImage("linkcourshaut.png");
       Linkimage.resize(60,60);
       myLink.moveUp = false;      
     } else if(keyCode == DOWN) {
       Linkimage = loadImage("linkmarchebas.png");
       Linkimage.resize(60,60);
       myLink.moveDown = false;
     }
  }
}
 
//PLAYER CLASS
 
class Link {
  float xPos;
  float yPos;
  float speed = 2;
  boolean moveLeft, moveRight, moveUp, moveDown = false;
 
  Link(float x_in, float y_in) {
    xPos = x_in;
    yPos = y_in;
  }
 
  void display() {
    fill(255);
    noStroke();
    image(Linkimage, xPos, yPos);
    Linkimage.resize(60,60);
  }
 
  void move() {
    if(moveLeft) xPos -= speed;
    if(moveRight) xPos += speed;
    if(moveUp) yPos -= speed;
    if(moveDown) yPos += speed;
    if (yPos >= 575) {
    moveDown = false;
    } 
  }
  }  

