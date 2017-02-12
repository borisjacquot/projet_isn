final int GRILLE_CARREAU_WIDTH = 50;
final int GRILLE_CARREAU_HEIGHT = GRILLE_CARREAU_WIDTH;

final int GRILLE_TYPE_LIBRE =0;
final int GRILLE_TYPE_MUR = 1;
final int GRILLE_TYPE_GOLD = 2;
int totalgoldDansMonde = 0;
int goldDansMonde = 0;


int[][] mondeGRILLE = { { 0, 1, 1, 0, 2, 1, 1, 0 },
                      { 0, 2, 2, 1, 0, 1, 1, 1 },
                      { 0, 1, 1, 0, 0, 1, 1, 1 },
                      { 0, 0, 1, 0, 0, 0, 1, 0 },
                      { 0, 1, 0, 1, 0, 0, 1, 0 } };
                      
void majGoldCompteur() {
  goldDansMonde = 0;
  for(int Rangee=0;Rangee<mondeGRILLE.length;Rangee++) {
    for(int Colonne=0;Colonne<mondeGRILLE[Rangee].length;Colonne++) {
     if(mondeGRILLE[Rangee][Colonne] == GRILLE_TYPE_GOLD) {
       goldDansMonde++;
     }
    }
  }
  totalgoldDansMonde = goldDansMonde;
}
                    
int CeQuiEstEnDessousDeCetteCoordonnee(int certainsX,int certainsY) {
  int certainsCARREAURangee = certainsY /GRILLE_CARREAU_HEIGHT;
  int certainsCARREAUColonne = certainsX /GRILLE_CARREAU_WIDTH;
  if(certainsX < 0) {
    return GRILLE_TYPE_MUR;
  }
  if(certainsY < 0) {
    return GRILLE_TYPE_MUR;
  }
  if(certainsCARREAURangee >= mondeGRILLE.length) {
    return GRILLE_TYPE_MUR;
  }
  if(certainsCARREAUColonne >= mondeGRILLE[0].length) {
    return GRILLE_TYPE_MUR;
  }  
  return mondeGRILLE[certainsCARREAURangee][certainsCARREAUColonne];
}
   
void changeCARREAU(int certainsX,int certainsY, int changerEn) {
  int certainsCARREAURangee = certainsY /GRILLE_CARREAU_HEIGHT;
  int certainsCARREAUColonne = certainsX /GRILLE_CARREAU_WIDTH;
  if(certainsX < 0) {
    return;
  }
  if(certainsY < 0) {
    return;
  }
  if(certainsCARREAURangee >= mondeGRILLE.length) {
    return;
  }
  if(certainsCARREAUColonne >= mondeGRILLE[0].length) {
    return;
  }  
  mondeGRILLE[certainsCARREAURangee][certainsCARREAUColonne] = changerEn;
}

void mondeDrawGRILLE() {
  noStroke();
  for(int Rangee=0;Rangee<mondeGRILLE.length;Rangee++) {
    for(int Colonne=0;Colonne<mondeGRILLE[Rangee].length;Colonne++) {
     switch(mondeGRILLE[Rangee][Colonne]) {
       case GRILLE_TYPE_LIBRE:
        fill(0,0,0);
        rect(Colonne *GRILLE_CARREAU_WIDTH, Rangee *GRILLE_CARREAU_HEIGHT, GRILLE_CARREAU_WIDTH, GRILLE_CARREAU_HEIGHT);
        break;
       case GRILLE_TYPE_MUR:
        fill(0,255,0);
        rect(Colonne *GRILLE_CARREAU_WIDTH, Rangee *GRILLE_CARREAU_HEIGHT, GRILLE_CARREAU_WIDTH, GRILLE_CARREAU_HEIGHT);
        break;
       case GRILLE_TYPE_GOLD:
        fill(0, 0, 0);
        rect(Colonne *GRILLE_CARREAU_WIDTH, Rangee *GRILLE_CARREAU_HEIGHT, GRILLE_CARREAU_WIDTH, GRILLE_CARREAU_HEIGHT);
        fill(255,255,0);
        ellipse(Colonne*GRILLE_CARREAU_WIDTH+GRILLE_CARREAU_WIDTH/2,Rangee*GRILLE_CARREAU_HEIGHT+GRILLE_CARREAU_HEIGHT/2,GRILLE_CARREAU_WIDTH,GRILLE_CARREAU_HEIGHT);
        break;
     }
    }
   }
}