boolean holdRight = false;
boolean holdLeft = false;
boolean holdUp = false;
boolean holdDown = false;

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
  if(keyCode == RIGHT) {
    holdRight = false;
    Perso = loadImage("linkmarche.png");
  }
    if(keyCode ==LEFT) {
    holdLeft = false;
    Perso = loadImage("linkmarchegauche.png");
  }
    if(keyCode == UP) {
    holdUp = false;
    Perso = loadImage("linkmarchehaut.png");
  }
    if(keyCode ==DOWN) {
    holdDown = false;
    Perso = loadImage("linkmarchebas.png");
  }
}

void Position() {
  int pxAvant = persoX;
  int pyAvant = persoY;
    if(holdRight) {
      
    persoX++;
    Perso = loadImage("linkcours.png");
  }
      if(holdLeft) {
    persoX--;
    Perso = loadImage("linkcoursgauche.png");
  }
      if(holdUp) {
    persoY--;
    Perso = loadImage("linkcourshaut.png");
  }
      if(holdDown) {
    persoY++;
    Perso = loadImage("linkcoursbas.png");
  }
  
  int CarreauSousPerso = CeQuiEstEnDessousDeCetteCoordonnee(persoX,persoY);
  
  if(CarreauSousPerso == GRILLE_TYPE_MUR) {
    persoX = pxAvant;
    persoY = pyAvant;
  } else if(CarreauSousPerso == GRILLE_TYPE_GOLD) {
    changeCARREAU(persoX,persoY,GRILLE_TYPE_LIBRE);
    goldDansMonde--;
  }
    
} 