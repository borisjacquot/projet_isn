int partie=0;    
int xbox=800;       //largeur boite ( Mettre valeur X de size()  )
int ybox=800;      //hauteur boite  ( Mettre valeur Y de size()  )
PImage level1;
PImage menu;


void setup()
{
 size(800,800);
 
 menu = loadImage("menu.png");
 Perso = loadImage("persobas2.png");
 level1=loadImage("level1.jpg");
 level1.resize(800, 800);
}
void draw()
{
  //Menu
  if(partie==0)
  {
  image(menu,0,0);
  }
   if (keyPressed || partie==0)    //lancer partie 
   {
   if (key == ENTER)
    {
      partie=1;            
    }
   }
   
    if(partie==1)
    {
       level1();
       mondeDrawGRILLE();
       deplacement();  
       enigme();
       vie();
       mort();
    }
 }
 //Appel aventurier
boolean appel=true;

//Initialisation Enigme 1
boolean enigme1=true;
boolean plaque1=false;
boolean plaque2=false;
boolean plaque3=false;
boolean enigme1fini=false;
boolean enigme2fini=false;
boolean enigme3fini=false;


//Initialisation Enigme 2
boolean enigme2=false;


//Initialisation Enigme 3
boolean enigme3=false;



//persoX-25   persoY-10



void enigme(){
  
  //Enigme 1
  fill(255,255,255,80);
  rect(160,480,40,40);
  rect(210,480,40,40);
  rect(260,480,40,40);
  if(enigme1==true){
 if (persoX-25>160 && persoX-25<200 && persoY-10>480 && persoY-10<520 && plaque2==false && plaque3==false){  //plaque1 gauche
 plaque1=true;
 }
 if (persoX-25>210 && persoX-25<250 && persoY-10>480 && persoY-10<520 && plaque2==true && plaque1==true){  //plaque3 millieu
 plaque3=true;
 enigme1fini=true;
 }
 if (persoX-25>260 && persoX-25<300 && persoY-10>480 && persoY-10<520 && plaque1==true && plaque3==false){  //plaque2 droite
 plaque2=true;
 }
  if(persoX-25>210 && persoX-25<250 && persoY-10>480 && persoY-10<520 && plaque2==false){  // si plaque 2 pas activé alors reset
   plaque1=false;
   plaque2=false;
 }
  if (persoX-25>260 && persoX-25<300 && persoY-10>480 && persoY-10<520 && plaque1==false){  //plaque2 droite
 plaque2=false;
 }
  }
 if(enigme1fini==true){
   enigme1=false;  //fin enigme 1
   enigme2=true;
   fill(255);
   rect(0,0,130,100);
   fill(0);
   text("Enigme 1 fini !",10,15);
  } 
  
  //enigme 2
  //empecher acces labyrinthe si enigme 2 non commencer
  if(enigme2==false){
  if(persoX-25>510){
    persoX=530;
    }
  }
      if(enigme2fini==false){
  if(persoX-25>520 && persoY-10<160 && persoY-10<200){
    persoX=530;
    }
    
    if(enigme2fini==true){
   enigme2=false;  //fin enigme 2
   enigme3=true;
   fill(0);
   text("Enigme 2 fini !",10,30);
  } 
    
    if(persoX-25<540 && persoY-10<160 && persoY-10<200){
     enigme2fini=true;
     fill(0);
     text("Enigme 2 fini !",10,30);
    }
    
    
    
  }  //fin enigme 2
 
 
 
   //Pnj
   
   //appel joueur
   if(appel==true){
     fill(0);
  text("Pssst,ici !",140,600);
   }
         //Box detec parole pnj
  fill(255,255,255,80);
  rect(140,620,50,50);
  
  //parole debut
  if(persoX-25>140 && persoX-25<190 && persoY-10>620 && persoY-10<670 && enigme1==true){
    appel = false;
    fill(255);
    rect(20,460,250,100);
    fill(0);
    text("Bonjour Aventurier !",25,480);
    text("Résouds les énigmes afin de",25,495);
    text("pénétrer dans le donjon",25,510);
    text("Enigme n°1 :",25,525);
    text("Appuie sur les plaques au dessus",25,540);
    text("dans le bon ordre.",25,555);
  }
  
  //parole enigme 2
  if(persoX-25>140 && persoX-25<190 && persoY-10>620 && persoY-10<670 && enigme1==false){
    fill(255);
    rect(20,460,250,100);
    fill(0);
    text("Félicitation Aventurier !",25,480);
    text("Pour la seconde enigme",25,495);
    text("Tu va braver l'obscurité !",25,510);
    text("Enigme n°2 :",25,525);
    text("Traverse le batiment à droite",25,540);
    text("Regarde où tu mets tes pieds !",25,555);
  }
  
  
  
  
 
 
}

int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;   //hauteur mur gauche
int hmurd = xbox-hmurg; // epaisseur mur droit

                        //Partie Décors


void level1()
{
  image(level1,0,0);
   text(mouseX,mouseX+20,mouseY);
 text(mouseY,mouseX+20,mouseY+40);
}

                                //Partie Collision

final int case_mur_largeur = 40;
final int case_mur_hauteur = case_mur_largeur;
final int case_libre =0;
final int case_mur = 1;
final int case_lave = 2;

int[][] mondeGRILLE = { 
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 2, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 2, 1, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 1, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 0, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1},
                      { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 2, 1, 1, 1},
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                      { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
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
             fill(0,0,255,20);
             rect(Colonne *case_mur_largeur, Rangee *case_mur_hauteur, case_mur_largeur, case_mur_hauteur);
             break;
           
             case case_mur:
             fill(0,0,0,80);
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
        //Chargement et position initial du personnage
PImage Perso;
int persoX=440,persoY=700;

//Stats vie
int vie=100;
int deg_lave=1;
int barrevie;
PImage MessMort;

                    //Partie deplacement personnage
boolean holdRight = false;
boolean holdLeft = false;
boolean holdUp = false;
boolean holdDown = false;

int persoVit=2;   // vitesse du personnage
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
  if(keyCode == RIGHT && vie>0)
    {
      holdRight = false;
      Perso = loadImage("persodroite2.png");
    }
    if(keyCode ==LEFT && vie>0)
    {
      holdLeft = false;
      Perso = loadImage("persogauche2.png");
    }
    if(keyCode == UP && vie>0)
    {
      holdUp = false;
      Perso = loadImage("persohaut2.png");
    }
    if(keyCode ==DOWN && vie>0)
    {
      holdDown = false;
      Perso = loadImage("persobas2.png");
    }
    
}

void deplacement()
{
int pxAvant = persoX;
int pyAvant = persoY;
 if(holdRight && vie>0)
 {
    persoX=persoX+persoVit;
    Perso = loadImage("persodroite1.png");
  }
      if(holdLeft && vie>0)
  {
    persoX=persoX-persoVit;
    Perso = loadImage("persogauche1.png");
  }
      if(holdUp && vie>0)
  {
    persoY=persoY-persoVit;
    Perso = loadImage("persohaut1.png");
  }
      if(holdDown && vie>0)
  {
    persoY=persoY+persoVit;
    Perso = loadImage("persobas1.png");
  } 
  int CarreauSousPerso = dessousperso(persoX-25,persoY-10);
  
  if(CarreauSousPerso == case_mur)
  {
    persoX = pxAvant;
    persoY = pyAvant;
  }
  if(CarreauSousPerso == case_lave)
  {
   vie=vie-deg_lave;
  }
}

void mort() 
{
  image(Perso,persoX-Perso.width,persoY-Perso.height);
  if (vie<=0)
  {
    Perso = loadImage("mort.gif");
  }
}

void vie()
{ 
  if(vie>0)
  {
    barrevie=vie;
  }
  if(vie<=0)
  {
    barrevie=0;
    image(MessMort,xbox/3,ybox/6); 
  }
  fill(0);
  rect(10,100,80,30);  //box vie
  fill(#ff0000);
  textSize(15);
  text("Vie",20,120);
  text(barrevie,50,120);
  
}