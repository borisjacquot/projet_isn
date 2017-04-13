        //Chargement et position initial du personnage
PImage Perso;
int persoX=400,persoY=400;

//Stats vie
int vie=100;
int deg_lave=1;
int barrevie;
PImage MessMort;

                    //Partie deplacement personnage
boolean holdRight = false;
boolean holdLeft = false;
boolean holdUp = false;
boolean holdDown = false;

int persoVit=2;   // vitesse du personnage
void keyPressed(){
  if(keyCode == RIGHT) {
    holdRight = true;
  }
    if(keyCode ==LEFT) {
    holdLeft = true;
  }
    if(keyCode == UP) {
    holdUp = true;
  }
    if(keyCode ==DOWN) {
    holdDown = true;
  }
}

void keyReleased() {
  if(keyCode == RIGHT && vie>0)
    {
      holdRight = false;
      Perso = loadImage("persodroite2.png");
    }
    if(keyCode ==LEFT && vie>0)
    {
      holdLeft = false;
      Perso = loadImage("persogauche2.png");
    }
    if(keyCode == UP && vie>0)
    {
      holdUp = false;
      Perso = loadImage("persohaut2.png");
    }
    if(keyCode ==DOWN && vie>0)
    {
      holdDown = false;
      Perso = loadImage("persobas2.png");
    }
    
}

void deplacement()
{
int pxAvant = persoX;
int pyAvant = persoY;
 if(holdRight && vie>0)
 {
    persoX=persoX+persoVit;
    Perso = loadImage("persodroite1.png");
  }
      if(holdLeft && vie>0)
  {
    persoX=persoX-persoVit;
    Perso = loadImage("persogauche1.png");
  }
      if(holdUp && vie>0)
  {
    persoY=persoY-persoVit;
    Perso = loadImage("persohaut1.png");
  }
      if(holdDown && vie>0)
  {
    persoY=persoY+persoVit;
    Perso = loadImage("persobas1.png");
  } 
  int CarreauSousPerso = dessousperso(persoX,persoY);
  
  if(CarreauSousPerso == case_mur)
  {
    persoX = pxAvant;
    persoY = pyAvant;
  }
  if(CarreauSousPerso == case_lave)
  {
   vie=vie-deg_lave;
  }
}

void mort() 
{
  image(Perso,persoX-Perso.width,persoY-Perso.height);
  if (vie<=0)
  {
    Perso = loadImage("mort.gif");
  }
}

void vie()
{ 
  if(vie>0)
  {
    barrevie=vie;
  }
  if(vie<=0)
  {
    barrevie=0;
    image(MessMort,xbox/3,ybox/6); 
  }
  fill(0);
  rect(10,80,90,60);
  fill(#ff0000);
  textSize(15);
  text("Vie",20,100);
  text(barrevie,50,100);
  text("Niveau :",20,130);
  text(partie,80,130);
  
}