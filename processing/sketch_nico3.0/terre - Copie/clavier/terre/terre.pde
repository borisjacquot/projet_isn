int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;   //hauteur mur gauche
int hmurd = xbox-hmurg; // epaisseur mur droit
PImage Perso;
int persoX=100,persoY=100;


PImage sol;
PImage bordure;
PImage canapeplante;
PImage murpobon;
PImage lac;
PImage muret;
PImage solmuret;
PImage solettable;



void setup()
{
 size(500,500);
 Perso = loadImage("linkmarche.png");
 
 lac = loadImage("lac.png");
 sol = loadImage("sol.png");
 bordure = loadImage("rangeedarbre.png");
 canapeplante= loadImage("canapeplante.png");
 murpobon= loadImage("murpobon.png");
 solmuret= loadImage("solmuret.png");
 solettable= loadImage("solettable.png");
 }

void draw()
{
 background(0);
 text("("+persoX+", "+persoY+")",mouseX,mouseY);

 environnement();
 //mondeDrawGRILLE();
 position();
 deplacement();
 }

void position() 
{
  image(Perso,persoX-Perso.width,persoY-Perso.height);
}

void environnement()
{
  int solX=hmurg+1;
  int solY=ymur+1;


  image(murpobon,solX,solY);
  image(murpobon,solX+100,solY);
  image(murpobon,solX+200,solY);
  image(murpobon,solX+300,solY);
  
  image(canapeplante,solX,solY+100);
  
  image(sol,solX+100,solY+100);
  image(sol,solX+200,solY+100);
  
  image(solettable,solX+300,solY+100);
  
  image(sol,solX,solY+200);
  image(sol,solX+100,solY+200);
  image(sol,solX+200,solY+200);
  
  image(solmuret,solX+300,solY+200);
  
  image(sol,solX,solY+300);
  image(sol,solX+100,solY+300);
  image(solmuret,solX+200,solY+300);  
  image(sol,solX+300,solY+300);
  image(sol,solX,solY+350);
  image(sol,solX+100,solY+350);
  image(sol,solX+200,solY+350);
  image(sol,solX+300,solY+350);
 
}