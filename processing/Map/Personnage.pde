        //Chargement et position initial du personnage
PImage Perso;
int persoX=440,persoY=700;

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
  int CarreauSousPerso = dessousperso(persoX-25,persoY-10);
  
  if(CarreauSousPerso == case_mur)
  {
    persoX = pxAvant;
    persoY = pyAvant;
  }
  if(CarreauSousPerso == case_lave)
  {
   vie=vie-deg_lave;
  }
  if(CarreauSousPerso == case_back)
  {
   persoX=540;
   persoY=620;
   vie=100;
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
    MessMort = loadImage("MessMort.png");
    image(MessMort,400,600);
  }
  fill(0);
  rect(10,100,80,30);  //box vie
  fill(#ff0000);
  textSize(15);
  text("Vie",20,120);
  text(barrevie,50,120);
  
}