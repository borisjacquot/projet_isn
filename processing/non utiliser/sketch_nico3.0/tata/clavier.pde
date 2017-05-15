boolean holdRight = false;
boolean holdLeft = false;
boolean holdUp = false;
boolean holdDown = false;
boolean holdpeche = false;
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

void deplacement()
{
int pxAvant = persoX;
int pyAvant = persoY;
 if(holdRight && vie>0)
 {
    persoX++;
    Perso = loadImage("linkcours.png");
  }
      if(holdLeft && vie>0)
  {
    persoX--;
    Perso = loadImage("linkcoursgauche.png");
  }
      if(holdUp && vie>0)
  {
    persoY--;
    Perso = loadImage("linkcourshaut.png");
  }
      if(holdDown && vie>0)
  {
    persoY++;
    Perso = loadImage("linkcoursbas.png");
  } 
  int CarreauSousPerso = dessousperso(persoX,persoY);  
  
  if(CarreauSousPerso == case_mur)
  {
    persoX = pxAvant;
    persoY = pyAvant;
  }
  if(CarreauSousPerso == case_eau)
  {
    persoX = pxAvant;
    persoY = pyAvant;
  }  
}
void keyReleased() {
  if(keyCode == RIGHT && vie>0)
    {
      holdRight = false;
      Perso = loadImage("linkmarche.png");
    }
    if(keyCode ==LEFT && vie>0)
    {
      holdLeft = false;
      Perso = loadImage("linkmarchegauche.png");
    }
    if(keyCode == UP && vie>0)
    {
      holdUp = false;
      Perso = loadImage("linkmarchehaut.png");
    }
    if(keyCode ==DOWN && vie>0)
    {
      holdDown = false;
      Perso = loadImage("linkmarchebas.png");
    }
      if(keyCode ==101 && vie>0);
  {
    holdpeche = false;
    Perso = loadImage("linkpeche.png");
  }
}