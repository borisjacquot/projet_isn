int partie_lancer=0;        // 1 lancer//  0 non lancer

PImage level1;

void setup()
{
 size(800,800);
         //Affectation des images a des noms
 Perso = loadImage("linkmarche.png");
 MessMort = loadImage("MessMort.png");
 level1= loadImage("level1.png");
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
       level1();
       mondeDrawGRILLE();
       position();
       deplacement();
       ennemi();
       vie();
       
    }
 }