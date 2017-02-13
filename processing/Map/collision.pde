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
             fill(0,0,0, 20);
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