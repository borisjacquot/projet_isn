        //Chargement des images
PImage sol;
PImage lave;
PImage lave_CoinHG;
PImage lave_CoinHD;
PImage lave_CoinBG;
PImage lave_CoinBD;
PImage lave_haut;
PImage lave_bas;
PImage lave_droit;
PImage lave_gauche;

int partie_lancer=0;        // 1 lancer//  0 non lancer

void setup()
{
 size(500,500);
 
         //Affectation des images a des noms
 Perso = loadImage("linkmarche.png");
 lave = loadImage("lave.png");
 MessMort = loadImage("MessMort.png");
 sol = loadImage("sol.png");
 lave_CoinHG= loadImage("lave_CoinHG.png");
 lave_CoinHD= loadImage("lave_CoinHD.png");
 lave_CoinBG= loadImage("lave_CoinBG.png");
 lave_CoinBD= loadImage("lave_CoinBD.png");
 lave_haut= loadImage("lave_haut.png");
 lave_bas= loadImage("lave_bas.png");
 lave_droit= loadImage("lave_droit.png");
 lave_gauche= loadImage("lave_gauche.png");
 }

void draw()
{
  //Menu
  background(0);
  text("Appuyez ENTRER pour commencer",xbox/4,ybox/2);
   if (keyPressed || partie_lancer==0)    //lancer partie 
   {
   if (key == ENTER)
    {
      partie_lancer=1;
    }
   }
   
    if(partie_lancer==1)
    {
       level_1();
       environnement_lvl_1();
       //mondeDrawGRILLE();
       ennemi();
       position();
       deplacement();
       vie();
       
    }
 }