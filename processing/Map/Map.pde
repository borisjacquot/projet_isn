int partie_lancer=0;        // 1 lancer//  0 non lancer
int partie_deux_lancer=0;  // 1 lancer//  0 non lancer   
int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
PImage level1;
PImage level2;

void setup()
{
 size(800,800);
 
 MessMort = loadImage("MessMort.png");
 Perso = loadImage("linkmarche.png");
 Perso.resize(30,30);
 level1=loadImage("level1.jpg");
 level1.resize(800, 800);
 level2=loadImage("level2.png");
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
       //ennemi();
       vie();     
    }
      
    if(persoY<100 && partie_lancer==1)
    {
     partie_lancer=0;  

     
    }
 }
