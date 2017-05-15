//Controls
int accx,accy,buttons;
int address = 0;

//Audio
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioSample explode;
AudioOutput out;
AudioPlayer bgmusic;
PinkNoise pn;

//Animation
PImage ship;
PImage flamesup;
PImage flamesdown;
PImage flamesleft;
PImage flamesright;
PImage explosion;
boolean collision = false;
boolean exploded = false;
int animleft = 1;
int animright = 1;
int animup = 1;
int animdown = 1;
int animcollision = 0;

//Bonus
Asteroid[] ast = new Asteroid[50];
int asteroidcount=0;
int currentasteroid=0;
int fly;
PImage roid;
PImage bonusimg = createImage(641,480,RGB);
boolean bonus=false;
float tempgravity=0;
PImage thousandpoints;
PImage fivehundredpoints;
PImage extralife;
boolean collectedred = false;
boolean collectedgreen = false;
boolean collectedblue = false;

//Ship
color black = color(0);
color white = color(255);
int spacewidth = 640;
int spaceheight = 480;
float xvelocity = 0;
float yvelocity = 0;
float terminalvelocity = 5;
float xaccel = .2;
float yaccel = 0;
float xpos = spacewidth/4;
float ypos = spaceheight/2;

//Game
int state = 4;
PFont font1,font2;
int score = 0;
int lives = 5;

void setup() {
  size(640, 480,P2D);
  //noCursor();

  minim = new Minim(this);  
  
  explode = minim.loadSample("explosion.wav");  
  out = minim.getLineOut(Minim.STEREO, 2048);
  pn = new PinkNoise(0);
  out.addSignal(pn);
  
  ship = loadImage("ship.gif");
  roid = loadImage("asteroid.gif");
  thousandpoints = loadImage("1000.gif");
  fivehundredpoints = loadImage("500.gif");
  extralife = loadImage("extralife.gif");
  
    bonusimg.loadPixels();
    for (int i=0; i<width*height; i++){
    if (int(random(1, 500)) > 1)
    bonusimg.pixels[i] = color(#000000);
    else
    bonusimg.pixels[i] = color(#ffffff);
    }
    bonusimg.updatePixels();

  bgmusic = minim.loadFile("BG.wav", 2048);    
  font1 = loadFont("Tahoma-20.vlw");
  font2 = loadFont("Consolas-BoldItalic-48.vlw");
}


void draw() {
  
switch(state){
  case 4: //Begin Bonus state
    if (!bgmusic.isPlaying()){
    bgmusic.rewind();
    bgmusic.play();
    }
    
    background(0);
    textFont(font2);
    text("Bonus Level",(width/2)-140,height/2-35);  
    textFont(font1);
    text("Press enter to start.",(width/2)-(159/2),height/2+70);  
  
    updateControls();
    if (buttons == 1){
      bonus = true; 
      xpos = 30;
      ypos = height/2;
      fly=0;
      state = 5;
      asteroidcount=0;
      currentasteroid = 0;
      buttons = 0;
      accx=0;
      accy=0;
      animcollision=0;
      exploded=false;
      collision=false;
      yvelocity=0;
      xvelocity=0;
    }
  break;
  case 5: //Bonus state
    image(bonusimg,0,0);
    
    if (!bgmusic.isPlaying()){
    bgmusic.rewind();
    bgmusic.play();
    }  
    
    bonusimg.loadPixels();
    for (int x=0;x<width;x++){
    for (int y=0;y<height;y++){
      bonusimg.pixels[y*641+x] = bonusimg.pixels[y*641+x+1];
    }
    }
    for (int y=0;y<height;y++){
     if (int(random(1, 500)) > 1)
      bonusimg.pixels[y*641+640] = color(#000000);
     else
      bonusimg.pixels[y*641+640] = color(#ffffff);
    }
    bonusimg.updatePixels();
    
    for(int i=0; i<asteroidcount;i++){
    if ((i == 10 && collectedblue) || (i == 30 && collectedgreen) || (i == 40 && collectedred))
    i++;
    ast[i].display();  
    }
    
    int dalpha;
    int ccolor;
    
    loadPixels();
    for (int h=0; h < ship.height; h++){  
    for (int w=0; w < ship.width; w++){
     dalpha = int(alpha(ship.pixels[h*ship.width+w]));
     ccolor = get(int(w+xpos),int(h+ypos));
     if ((dalpha == 255) && (ccolor != black && ccolor != white && ccolor != 0) && (!collision)){
      println(hex(ccolor,6));
      if ((ccolor >>16 & 0xff) == (ccolor >>8 & 0xff) && (ccolor >>16 & 0xff) == (ccolor & 0xff)){
      pn.setAmp(0);
      explode.trigger();
      exploded = true;
      collision = true;    
      }
      else if ((ccolor >> 8 & 0xff) == (ccolor & 0xff) && !collectedred){
        lives++;
        collectedred = true;
      }
      else if ((ccolor >>16 & 0xff) == (ccolor & 0xff) && !collectedgreen){
        score+=1000;
        collectedgreen = true;
      }    
      else if ((ccolor >>16 & 0xff) == (ccolor >>8 & 0xff) && !collectedblue){
        score+=500;
        collectedblue = true;
      }
     }
    }
    }
    updatePixels();
  
    if (exploded){
      explosion = loadImage("explosion" + nf(animcollision, 4) + ".gif");   
      image(explosion,xpos-ship.width,ypos-ship.height);
      animcollision++;
      delay(35);
      if (animcollision == 14){
       state = 4;
      }
    } else {
      updateControls();
      updateAcceleration();
      updatePosition();
    
      image(ship, xpos, ypos);
     
      if (xpos < -30 || xpos > width || ypos < -30 || ypos > height){
       state = 4;
      }
    
      updateFlames();
    
      if (fly%50 == 0){
      ast[currentasteroid] = new Asteroid();
      if (asteroidcount <50)
      asteroidcount++;
      currentasteroid++;
      if (currentasteroid == 50)
      currentasteroid = 0;    
      }
      fly++;
    }
  break;
  }//end switch state
}//end draw




void stop(){
  // always close Minim audio classes when you are done with them
  bgmusic.close();
  explode.close();
  out.close();
  minim.stop();
  super.stop();
}




void updateControls(){
  if (accy >0)
    accy-=1;
  if (accy <0)
    accy+=1;
    
  if (accx >0)
    accx-=1;
  if (accx <0)
    accx+=1;
}


void keyPressed() {
    if (keyCode == UP)
      accy-=3;
    if (keyCode == DOWN)
      accy+=3;
    if (keyCode == LEFT)
      accx-=3;
    if (keyCode == RIGHT)
      accx+=3;
    if (keyCode == ENTER)
      buttons = 1;
}


void updateAcceleration(){    

  xaccel= float(accx)/100;
  yaccel= float(accy)/100;  
}

void updatePosition(){
  yvelocity+=yaccel;
  xvelocity+=xaccel;

  if (abs(yvelocity) > terminalvelocity){
   if (yvelocity > 0)
    yvelocity = terminalvelocity;
   else
    yvelocity = -terminalvelocity;
  }

  if (abs(xvelocity) > terminalvelocity){
   if (xvelocity > 0)
    xvelocity = terminalvelocity;
   else
    xvelocity = -terminalvelocity;
  }

  ypos += yvelocity;
  xpos += xvelocity;
}

void updateFlames(){
  float Xloc,Yloc,Panning,XAmp,YAmp,Amplitude;
  int tinted;
  
  Xloc=xaccel;
  Yloc=yaccel;
  
  Panning = map(Xloc,-.4,.4,1,-1);

  Xloc = abs(Xloc);
  Yloc = abs(Yloc);

  if (abs(Panning) + Yloc > 1){
   if (Panning < 0)
    Panning = Yloc-1;
   if (Panning >0)
    Panning = 1-Yloc;
  }

  XAmp = map(Xloc,0,.4,.2,1);
  YAmp = map(Yloc,0,.4,.2,1);

  if (XAmp == .2)//XXXXXXXXXXXXXXXXXXXXXXXXXXX???????????
   XAmp = 0;
  if (YAmp == .2)
   YAmp = 0;

  Amplitude = map(XAmp+YAmp,0,2,0,1);

  if (Amplitude > 1)
   Amplitude = 1;
  if (Amplitude < 0)
   Amplitude = 0;

  pn.setAmp(Amplitude);
  pn.setPan(Panning);  
  
  if (yaccel < 0){
   flamesdown = loadImage("flamesdown" + animdown + ".gif");
   tinted = int(abs(yaccel*100*3));
   tinted ^= 0xff;
   tint(255, tinted & 0xff, 0); 
   image(flamesdown,xpos,ypos+ship.height);
   noTint();
   animdown++;
   if (animdown == 4)
   animdown = 1;
  }  
  if (yaccel > 0){
   flamesup = loadImage("flamesup" + animup + ".gif");
   tinted = int(abs(yaccel*100*3));
   tinted ^= 0xff;
   tint(255, tinted & 0xff, 0);   
   image(flamesup,xpos,ypos-flamesup.height);
   noTint();  
   animup++;
   if (animup == 4)
   animup = 1;
  }  
  if (xaccel < 0){
   flamesright = loadImage("flamesright" + animright + ".gif");
   tinted = int(abs(xaccel*100*3));
   tinted ^= 0xff;
   tint(255, tinted & 0xff, 0);   
   image(flamesright,xpos+ship.width,ypos);
   noTint();  
   animright++;
   if (animright == 4)
   animright = 1;
  }  
  if (xaccel > 0){
   flamesleft = loadImage("flamesleft" + animleft + ".gif");
   tinted = int(abs(xaccel*100*3));
   tinted ^= 0xff;
   tint(255, tinted & 0xff, 0);   
   image(flamesleft,xpos-flamesleft.width,ypos);
   noTint();  
   animleft++;
   if (animleft == 4)
   animleft = 1;
  }
}



class Asteroid{
  float x;
  float addx;
  float y;
  float addy;
  float big;
  float r;
  float addr;
  int type;
Asteroid(){ 
  x=width+roid.width;
  y=random(0,480);
  r=0;
  addx=random(-2,-.5);
  addy=random(-.5,.5);
  addr=random(-5,5);
  big=random(.5,1);
  type = 0;
  if (currentasteroid == 40){
  collectedred = false;
  type = 1;
  }
  if (currentasteroid == 30){
  collectedgreen = false;
  type = 2;
  }
  if (currentasteroid == 10){
  collectedblue = false;
  type = 3;
  }
}

void display(){
switch(type){
case 0:
pushMatrix();
translate(x,y);  
scale(big);
rotate(radians(r));
beginShape();
texture(roid);
noStroke();
noFill();
vertex(-(roid.width/2), -(roid.height/2), 0, 0);
vertex(roid.width/2, -(roid.height/2), roid.width, 0);
vertex(roid.width/2, roid.height/2, roid.width, roid.height);
vertex(-(roid.width/2), roid.height/2, 0, roid.height);
endShape();
popMatrix();
break;
case 1:
image(extralife,x,y);
break;
case 2:
image(thousandpoints,x,y);
break;
case 3:
image(fivehundredpoints,x,y);
break;
}

x+=addx;
y+=addy;
r+=addr;
}
}


