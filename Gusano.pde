//Gusanos, son obstaculos para las naves 
class Gusano {  
  float posX;
  float posY;
  float velGusano;
  float dirX;
  float dirY;
  
  color colorGusano;

//tamaño gusano
  int tamGusano;
  int tamGusano1;
  //radio de curva para el gusano
  int radGusano;
  
  //ojo gusano
  float ojoX;
  float ojoY;
  float tamOjo;
  color colorOjo;
  
  //pupila gusano
  float pupilaX;
  float pupilaY;
  float tamPupila;
  color colorPupila;
  
  
  Gusano(float posX1, float poxY1, int tam1, int tam2, int radGusano1,
  float velGusano1, color color1, int dir1, int dir2, float ojoX1, float ojoY1, 
  float tamOjo1, color colorOjo1, float pupilaX1, float pupilaY1, float tamPupila1,
  color colorPupila1){
    posX = posX1; 
    posY = poxY1 ; 
    
    velGusano = velGusano1;
    dirX = dir1;
    dirY = dir2;
    
    colorGusano = color1;
    tamGusano = tam1;
    tamGusano1 = tam2;
    radGusano = radGusano1;
    
    ojoX = ojoX1;
    ojoY = ojoY1;
    tamOjo = tamOjo1;
    colorOjo = colorOjo1;
    pupilaX = pupilaX1;
    pupilaY = pupilaY1;
    tamPupila = tamPupila1;
    colorPupila = colorPupila1;  
  }
  
  //movimiento de gusanos
  void moverse(float mov){
        
    posX = posX + velGusano/2 * dirX;
    if (posX > width || posX < 0) {
     dirX = -dirX;
    } 
    
    posY = posY + velGusano * dirY;
    if (posY > height || posY < 0) {
     dirY = -dirY;
     }
     
     ojoX = ojoX + velGusano/2 * dirX;
    if (ojoX > width || ojoX < 0) {
     dirX = -dirX;
    } 
    
    ojoY = ojoY + velGusano * dirY;
    if (ojoY > height || ojoY < 0) {
     dirY = -dirY;
     }
     
      pupilaX = pupilaX + velGusano/2 * dirX;
    if (pupilaX > width || pupilaX < 0) {
     dirX = -dirX;
    } 
    
    pupilaY = pupilaY + velGusano * dirY;
    if (pupilaY > height || pupilaY < 0) {
     dirY = -dirY;
     }
  }
  //se dibujan los gusanos y sus ojos
  void pintarse(){
    fill(colorGusano);
    rect(posX, posY, tamGusano, tamGusano1, radGusano);
    fill(colorOjo);
    circle(ojoX, ojoY, tamOjo);
    fill(colorPupila);
    circle(pupilaX, pupilaY, tamPupila);
     
  }  
}
