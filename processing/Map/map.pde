int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;   //hauteur mur gauche
int hmurd = xbox-hmurg; // epaisseur mur droit
PImage Perso;
int persoX=100,persoY=100;
PImage lave;
int laveX=200;
int laveY=200;
PImage sol;
PImage lave_CoinHG;
PImage lave_CoinHD;
PImage lave_CoinBG;
PImage lave_CoinBD;
PImage lave_haut;
PImage lave_bas;
PImage lave_droit;
PImage lave_gauche;



void setup()
{
 size(500,500);
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
 level();
 vie();
 environnement();
 //mondeDrawGRILLE();
 position();
 deplacement();
 }


void level()
{
  fill(255);
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
void position() 
{
  image(Perso,persoX-Perso.width,persoY-Perso.height);
  if (vie<=0)
  {
    Perso = loadImage("mort.gif");
  }
}

void environnement()
{
  int solX=hmurg+1;
  int solY=ymur+1;
  
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