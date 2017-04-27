//Initialisation Enigme 1
boolean enigme1=true;
boolean plaque1=false;
boolean plaque2=false;
boolean plaque3=false;
boolean enigme1fini=false;

//Initialisation Enigme 2
boolean enigme2=false;


//Initialisation Enigme 3
boolean enigme3=false;



//persoX-25   persoY-10



void enigme(){
  //Pnj
  
  
  //Enigme 1
  fill(0);
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
  
  
 
}