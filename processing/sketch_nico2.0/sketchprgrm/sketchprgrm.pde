int persoX=100,persoY=100;
PImage Perso;

void setup () {
   size(600, 400);
   majGoldCompteur();
   Perso = loadImage("linkmarche.png");
}

void draw() {
  Position();
  
  background(100);
  text("("+persoX+", "+persoY+")",mouseX,mouseY);
  mondeDrawGRILLE();
  fill(255,255,255);
  //ellipse(persoX,persoY,10,10);
  image(Perso,persoX-Perso.width,persoY-Perso.height);
  if(goldDansMonde == 0) {
    text("You Win",width-100,height-30);
  } else {
  text(goldDansMonde+"/"+totalgoldDansMonde,width-100,height-30);
}
}