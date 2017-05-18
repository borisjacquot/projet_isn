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
   rect(0,0,130,60);
   fill(0);
   text("Enigme 1 finie !",10,15);
  } 
  
  //enigme 2
  //empecher acces labyrinthe si enigme 2 non commencer
  if(enigme2==false){
  if(persoX-25>510){
    persoX=530;
    }
  }
    
    
    if(persoX==530 && persoY>130 && persoY<220){
     enigme2fini=true;
     appel = false;
     fill(0);
     text("Enigme 2 finie !",10,30);
    }
    
     if(enigme2fini==true){
   enigme2=false;  //fin enigme 2
   enigme3=true;
   fill(0);
   text("Enigme 2 finie !",10,30);
  } 
    
    //fin enigme 2
 
 if(enigme3==true){
   if (keyPressed) {
     if (key == 'v'  && enigme3fini==false || key == 'V'  && enigme3fini==false) {
         enigme1=true;
         enigme1fini=false;
         enigme2=false;
         enigme2fini=false;
         enigme3=false;
         persoX=440;
         persoY=700;
     }
     if (key == 'f'  && enigme3fini==false || key == 'F' && enigme3fini==false) {
         
         enigme3fini=true;
         persoX=200;
         persoY=180;
     }
   }
 }
if(enigme3fini==true){
   enigme3=false;
   text("Enigme 3 finie !",10,45);
   text("Jeu fini !",10,60);
}

 
 
 
   //Pnj
   
   //appel joueur
   if(appel==true){
     fill(0);
  text("Pssst,ici !",140,600);
   }
         //Box detec parole pnj
  //fill(255,255,255,80);
  //rect(140,620,50,50);
  
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
    appel = false;
    fill(255);
    rect(20,460,250,100);
    fill(0);
    text("Félicitation Aventurier !",25,480);
    text("Pour la seconde énigme",25,495);
    text("Tu vas braver l'obscurité !",25,510);
    text("Enigme n°2 :",25,525);
    text("Traverse le bâtiment à droite",25,540);
    text("Regarde où tu mets tes pieds !",25,555);
  }
  
  //parole enigme3
  if(enigme3==true){
    fill(255);
    rect(20,460,300,120);
    fill(0);
    text("Félicitation Aventurier !",25,480);
    text("Pour la dernière énigme,",25,495);
    text("Tu va devoir répondre à une question !",25,510);
    text("Réponds en avec ton clavier.",25,525);
    text("Si tu te trompes, tu recommence le jeu !",25,540);
    text("Enigme n°3",25,555);
    text("Ce jeu est en 3D. Vrai/Faux ?",25,570);
  }
  //parole jeu fini
  if(enigme3fini){
  fill(255);
    rect(20,460,300,100);
    fill(0);
    text("Ahahah ! Te voilà piégé !",25,480);
    text("Tu ne sortiras jamais de cet endroit !",25,495);
    text("Je suis un grand magicien,",25,510);
    text("je vais reprendre le contrôle",25,525);
    text("de ce royaume et assouvir ma",25,540);
    text("vengeance depuis mes 10milles ans!",25,555);
  }
  
 
 
}