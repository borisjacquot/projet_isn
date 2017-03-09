int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;   //hauteur mur gauche
int hmurd = xbox-hmurg; // epaisseur mur droit

                        //Partie Décors
void level_1()
{
  fill(0);
  rect(hmurg+1,ymur+1,xbox-100,ybox-(75-ymur)); //fond sol
  line(hmurg,ymur,xbox-hmurg,ymur);
  fill(0);
  line(hmurg,ymur,xbox-hmurg,ymur);
  line(hmurg,ymur,hmurg,xbox-25);
  line(xbox-(hmurg),ymur,xbox-epmur,epmur);        // arrete mur haut droit
  line(epmur,epmur,hmurg,ymur);                   // arrete mur haut gauche
  line(hmurg,xbox-25,epmur,xbox-epmur);          // arrete mur bas gauche
  line(xbox-hmurg,ybox-25,xbox,ybox-5);         // arrete mur bas droit
  noStroke();
  fill(0);
  rect(0,0,xbox,epmur);              // haut mur haut
  rect(0,0,epmur,ybox);             //haut mur Gauche
  rect(0,ybox-epmur,xbox,epmur);    //haut mur Haut
  rect(xbox-epmur,0,epmur,ybox);   //haut mur Droit
}

void environnement_lvl_1()
{
  int solX=hmurg+1;
  int solY=ymur+1;
  int laveX=200;
  int laveY=200;
                              //sol
  image(sol,solX,solY);
  image(sol,solX+100,solY);
  image(sol,solX+200,solY);
  image(sol,solX+300,solY);
  image(sol,solX,solY+100);
  image(sol,solX+100,solY+100);
  image(sol,solX+200,solY+100);
  image(sol,solX+300,solY+100);
  image(sol,solX,solY+200);
  image(sol,solX+100,solY+200);
  image(sol,solX+200,solY+200);
  image(sol,solX+300,solY+200);
  image(sol,solX,solY+300);
  image(sol,solX+100,solY+300);
  image(sol,solX+200,solY+300);
  image(sol,solX+300,solY+300);
  image(sol,solX,solY+350);
  image(sol,solX+100,solY+350);
  image(sol,solX+200,solY+350);
  image(sol,solX+300,solY+350);
                                                //Lave
  image(lave_CoinHG,laveX-lave.width,laveY);
  image(lave_haut,(laveX+25)-lave.width,laveY);
  image(lave_CoinHD,(laveX+50)-lave.width,laveY);
  image(lave_gauche,laveX-lave.width,laveY+25);
  image(lave,(laveX+25)-lave.width,laveY+25);
  image(lave_droit,(laveX+50)-lave.width,laveY+25);
  image(lave_CoinBG,laveX-lave.width,laveY+50);
  image(lave_bas,(laveX+25)-lave.width,laveY+50);
  image(lave_CoinBD,(laveX+50)-lave.width,laveY+50);
}


                                //Partie Collision

  
final int case_mur_largeur = 25;
final int case_mur_hauteur = case_mur_largeur;
final int case_libre =0;
final int case_mur = 1;
final int case_lave = 2;

int[][] mondeGRILLE = { 
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1} ,
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                      };
                      
                    
int dessousperso(int certainsX,int certainsY)
  {
    int certainsCARREAURangee = certainsY /case_mur_hauteur;
    int certainsCARREAUColonne = certainsX /case_mur_largeur;
    if(certainsX < 0) 
    {
      return case_mur;
    }
  if(certainsY < 0) 
  {
    return case_mur;
  }
  if(certainsCARREAURangee >= mondeGRILLE.length)
   {
     return case_mur;
   }
  if(certainsCARREAUColonne >= mondeGRILLE[0].length)
  {
   return case_mur;
  }
  return mondeGRILLE[certainsCARREAURangee][certainsCARREAUColonne];
  }
   
void changeCARREAU(int certainsX,int certainsY, int changerEn) 
{
  int certainsCARREAURangee = certainsY /case_mur_hauteur;
  int certainsCARREAUColonne = certainsX /case_mur_largeur;
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

void mondeDrawGRILLE() 
{
  noStroke();
  for(int Rangee=0; Rangee<mondeGRILLE.length; Rangee++) 
    {
      for(int Colonne=0;Colonne<mondeGRILLE[Rangee].length;Colonne++) 
        {
           switch(mondeGRILLE[Rangee][Colonne]) 
          {
             case case_libre:
             fill(0,0,0,20);
             rect(Colonne *case_mur_largeur, Rangee *case_mur_hauteur, case_mur_largeur, case_mur_hauteur);
             break;
           
             case case_mur:
             fill(0,255,0,10);
             rect(Colonne *case_mur_largeur, Rangee *case_mur_hauteur, case_mur_largeur, case_mur_hauteur);
             break;
             
             case case_lave:
             fill(255,0,0,50);
             rect(Colonne *case_mur_largeur, Rangee *case_mur_hauteur, case_mur_largeur, case_mur_hauteur);
             break;
          }
        }
   }
}