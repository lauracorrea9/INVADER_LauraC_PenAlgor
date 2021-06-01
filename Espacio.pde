Gusano gus1;
Gusano gus2;
Estrellas estre;
Naves nave1;
Naves naveInicio1;
Naves naveInicio2;
Planeta luna;
Planeta tierra;
Planeta sol;
Aliens alien1;
Aliens alien2;
Aliens alien3;
Aliens alien4;
Aliens alien5;
int mov;

//tabla que guarda los puntajes regisrados 
Table puntaje;

int tiempoInicial;
int tiempoJuego;

//los disparos de la nave para eliminar a los aliens
ArrayList <Disparos> disparo;

// pantalla de inicio
PImage nombre;
PImage play;
PImage boton;

//pantalla escoge tu nave
PImage choose;

//pantalla instrucciones
PImage instrucciones;

//pantalla perdio 
PImage lose;

//pantalla gano
PImage win;

//pantalla score
PImage score;

//varaiable de estado
int estado;

//pantalla de inicio, escoger nave, inicio de juego, gano juego, perdio juego, score
int PINICIO = 0; 
int NAVE = 1;
int INSTRUCCIONES = 2;
int INICIO_JUEGO = 3;
int PERDIO = 4;
int GANO = 5;
int SCORE = 6;

void setup(){
  background (#212529);
  size (500, 500);
  noStroke();
  
  //iniciar variable de estado 
  estado = PINICIO; 
  
  //declarar cada objeto
  gus1 = new Gusano(0, 0, 70, 10, 10, 3.5, color(#43aa8b), 1, 1, 0, 0, 10, color(#ffffff),
  0, 0, 5, color(#000000));
  gus2 = new Gusano(0, 0, 70, 15, 15, 2.5, color(#f8961e), 1, 1, 0, 0, 10, color(#ffffff),
  0, 0, 5, color(#000000));
  
  estre = new Estrellas();
  
  nave1 = new Naves(134, 492, 161, 447, 187, 492, 20, color(#FE2F20));
  
  naveInicio1 = new Naves(134, 492, 161, 447, 187, 492, 20, color(#FE2F20));
  naveInicio2 = new Naves(348, 492, 373, 447, 399, 492, 20, color(#44DAD5));
    
  luna = new Planeta(0, 0, 90, 0.5, color(#8d99ae), 15);
  tierra = new Planeta(0, 0, 75, 1, color(#118ab2), 20);
  sol = new Planeta(0, 0, 5, 0.9, color(#ffbe0b), 30);
  
  alien1 = new Aliens(30, 0, 30, 5, 1, color(#6252CB), 30, 0, 10, 30, 0, 5, 
  color(#ffffff), color(#000000));
  alien2 = new Aliens(135, 0, 30, 5, 1, color(#6252CB), 135, 0, 10, 135, 0, 5, 
  color(#ffffff), color(#000000));
  alien3 = new Aliens(250, 0, 30, 5, 1, color(#6252CB), 250, 0, 10, 250, 0, 5, 
  color(#ffffff), color(#000000));
  alien4 = new Aliens(350, 0, 30, 5, 1, color(#6252CB), 350, 0, 10, 350, 0, 5, 
  color(#ffffff), color(#000000));
  alien5 = new Aliens(470, 0, 30, 5, 1, color(#6252CB), 470, 0, 10, 470, 0, 5, 
  color(#ffffff), color(#000000)); 
  
  //inicializar disparos
  disparo = new ArrayList<Disparos>();
  
  //inicializar el movimiento
  mov = 0;
  
  //nombre en pantalla de inicio
  nombre = loadImage("invader.png");
  nombre.resize(454, 95);
  imageMode(CENTER);
  
  play = loadImage("play.png");
  play.resize(91, 32);
  imageMode(CENTER);
  
  boton = loadImage("botón.png");
  boton.resize(30, 30);
  imageMode(CENTER);
  
  choose = loadImage("color.png");
  imageMode(CENTER);
  
  instrucciones = loadImage ("instrucciones.png");
  imageMode(CENTER);
  
  lose = loadImage("lose.png");
  imageMode(CENTER);
  
  win = loadImage("win.png");
  imageMode(CENTER);
  
  score = loadImage("score.png");
  imageMode(CENTER);
  
  tiempoInicial = millis();
  
  //puntaje = new Table ();  
  //puntaje.addColumn("fecha");
  //puntaje.addColumn("tiempo");
  
  puntaje = loadTable("data/puntajesjuego.csv", "header");
  
}

void draw(){
  if (estado == PINICIO){
    //lo que se ejecuta en la pantalla de inicio del juego 
    background(#264653);
    image(nombre, 253, 60);
    image(play, width/2, height/2);
    image(boton, 250, 290);
  }
  
   else if (estado == INSTRUCCIONES){
    //pantalla de instrucciones
    background (#FE621D);
    image(instrucciones, width/2, height/2);
  }
  
  else if (estado == NAVE){
    //lo que se ejecuta cuando se esta escogiendo la nave    
    background (#6F9283);
    image(choose, 257, 35);
    
    naveInicio1.pintarse();  
    naveInicio2.pintarse();  
    
  }
 
  else if (estado == INICIO_JUEGO){
    //se ejecuta el juego     
    
  background (#212529);
  
  mov = mov + 1;
  
  //se pintan y se mueven los objetos
  gus1.pintarse();
  gus1.moverse(mov);
  
  gus2.pintarse();
  gus2.moverse(mov);
  
  estre.pintarse();
  estre.moverse();
  
  nave1.pintarse();    
    
  luna.pintarse();
  luna.moverse(mov);
  
  tierra.pintarse();
  tierra.moverse(mov);
  
  sol.pintarse();
  sol.moverse(mov);
  
  alien1.pintarse();
  alien1.moverse(mov);
  
  alien2.pintarse();
  alien2.moverse(mov);
  
  alien3.pintarse();
  alien3.moverse(mov);
  
  alien4.pintarse();
  alien4.moverse(mov);
  
  alien5.pintarse();
  alien5.moverse(mov);
  
  //mostrando los disparos 
  for (int i = disparo.size()-1; i >= 0; i --){
    Disparos disp = disparo.get(i);
    disp.dibujar();
    disp.moverse();  
  }
    
  // verificar cercanía aliens y disparos
  for (int dispa = 0; dispa < disparo.size(); dispa=dispa+1){
    Disparos temporal = disparo.get(dispa);
    
    boolean respuestaAlien1 = alien1.tocar(temporal);
    boolean respuestaAlien2 = alien2.tocar(temporal);
    boolean respuestaAlien3 = alien3.tocar(temporal);
    boolean respuestaAlien4 = alien4.tocar(temporal);
    boolean respuestaAlien5 = alien5.tocar(temporal);
    
    if(respuestaAlien1 == true && respuestaAlien2 == true && respuestaAlien3 == true &&
    respuestaAlien4 == true && respuestaAlien5 == true ){
      temporal.impactoAlien();
      estado = GANO;
    }
   }
   
   //si la nave toca en gusano perdio
  float distanciaGus1 = dist(nave1.posX + 26 + nave1.movX, nave1.posY - 22 + nave1.movY, gus1.posX, gus1.posY);
    
  float distanciaGus2 = dist(nave1.posX + 26 + nave1.movX, nave1.posY - 22 + nave1.movY, gus2.posX, gus2.posY);
    
    //println("gus1 " + distanciaGus1);
    //println("gus2 " + distanciaGus2);
    
    //println(nave1.posX, nave1.posY);
    
    if (distanciaGus1 < 60){
      //println("lotoco");
      estado = PERDIO;
      
      //cuanto tiempo jugo 
      tiempoJuego = (millis() - tiempoInicial)/100;
      
      int mes =  month();
      int dia =  day();
      int hora = hour();
      int minuto = minute();
      
      String fechaJuego = mes+"-"+dia+" "+hora+":"+minuto;
      
     TableRow nuevaFila = puntaje.addRow();
     nuevaFila.setInt("tiempo", tiempoJuego);
     nuevaFila.setString("fecha", fechaJuego);
  
     saveTable(puntaje, "data/puntajesjuego.csv");
    }
    
   if (distanciaGus2 < 60){
      estado = PERDIO;
      
      //cuanto tiempo jugo
      tiempoJuego = (millis() - tiempoInicial)/100;
      
      int mes =  month();
      int dia =  day();
      int hora = hour();
      int minuto = minute();
      
      String fechaJuego = mes+"-"+dia+" "+hora+":"+minuto;
      
     TableRow nuevaFila = puntaje.addRow();
     nuevaFila.setInt("tiempo", tiempoJuego);
     nuevaFila.setString("fecha", fechaJuego);
  
     saveTable(puntaje, "data/puntajesjuego.csv");
    }
    
    fill(255);
    textSize(15);
    text("Tiempo:", width - 80, 20);
    text(str((millis() - tiempoInicial)/100), width - 80, 40);
    
  }
  else if (estado == GANO){
    //se ejecuta cuando el jugador gano
    background(#F0BE19);
    image(win, width/2, height/2);
    fill(255);
    textSize(15);
    text("para score oprima S", (width/2) - 70, (height/2) + 70);
  }
  else if (estado == PERDIO){
    //se ejecuta cuando el jugador perdio
    background(#1C2541);
    image(lose, width/2, height/2);  
    fill(255);
    textSize(15);
    text("para score oprima S", (width/2) - 70, (height/2) + 70);
   
  }
  
  else if (estado == SCORE){
    //se ejecuta al final del juego para mostrarle al jugador su puntaje
    background(#23F0C7);
    image(score, width/2, height/2); 
    fill(0);
    textSize(25);
    text(tiempoJuego, (width/2), (height/2) + 70);
  }
  
}

void mousePressed(){
  //le da play y tiene que escoger el color de su nave
  if (mouseX > 230 && mouseX < 320 && estado == PINICIO){
    estado = INSTRUCCIONES;
  }
  else if (mouseX < 250 && estado == NAVE){
    //escoge la nave roja
    estado = INICIO_JUEGO;  
    nave1 = naveInicio1;
    tiempoInicial = millis();
  }
  else if(mouseX > 250 && estado == NAVE){
    //escoge nave azul 
    estado = INICIO_JUEGO;
    nave1 = naveInicio2;
  }  
}

void keyReleased(){
  //presionar P para perder
  //if(key == 'p'){
  //  estado = PERDIO;
  //}
  ////presionar G para ganar
  //else if (key == 'g'){
  //  estado = GANO;
  //}
  //presionar C para pasar las instrucciones
  if (key == 'c'){
    estado = NAVE;
  }
  //presionar S para mostrar el puntaje
  else if (key == 's'){
    estado = SCORE;
  }
}
 void keyPressed(){
  if(estado == INICIO_JUEGO){
    //para que la nave se mueva
   if(keyCode == LEFT){
      nave1.moverizq();
    }
    else if(keyCode == RIGHT){
      nave1.moverdere();
    }
  }
  //disparar con la barra espaciadora
  if(key == ' '){
    disparo.add(new Disparos(nave1.posX + nave1.movX, nave1.posY + nave1.movY));
  }
}
