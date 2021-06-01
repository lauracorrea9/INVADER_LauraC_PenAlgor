//El enemigo principal, quieren invadir los planetas
class Aliens{
  float posX;
  float posY;
  
  int velAlien;
  int dirY;
  
  color colorAlien;
  float tamAlien;
  
  float movY;

  //ojo del alien
  float ojoX;
  float ojoY;
  float tamOjo;
  float pupilaX;
  float pupilaY;
  float tamPupila;
  
  color colorOjo;
  color colorPupila;
  
  boolean impactado = false;
  
  
  Aliens(float posX1, float posY1, float tamAlien1, int velAlien1, int dirY1, 
  color colorAlien1, float ojoX1, float ojoY1, float tamOjo1, float pupilaX1,
  float pupilaY1, float tamPupila1, color colorOjo1 ,color colorPupila1){
   
    posX = posX1;
    posY = posY1;
    
    velAlien = velAlien1;
    dirY = dirY1;
    
    colorAlien = colorAlien1;
    tamAlien = tamAlien1;
    
    ojoX = ojoX1;
    ojoY = ojoY1;
    tamOjo = tamOjo1;
    colorOjo = colorOjo1;
    
    pupilaX = pupilaX1;
    pupilaY = pupilaY1;
    tamPupila = tamPupila1;
    colorPupila = colorPupila1;
   
  }
    
 
  //movimiento de aliens
  void moverse(float mov){
    
    movY = movY + velAlien * dirY;
     if (movY > height || movY < 0) {
     dirY = -dirY;
     }
  }
  void pintarse(){
  if (impactado == false){
    //alien
    fill(colorAlien);
    circle(posX, posY + movY, tamAlien);
  //ojo alien
    fill(colorOjo);
    circle(ojoX, ojoY + movY, tamOjo);
  //pupila alien
    fill(colorPupila);
    circle(pupilaX, pupilaY + movY, tamPupila);
   }
  }
  
  //método para resolver si un dirparo impacto un alien
boolean tocar(Disparos disp){
    float distancia = dist(disp.posX, disp.posY, posX, posY + movY);
    if(distancia < tamAlien){
      impactado = true;
    }
    return impactado;
  }
  
}
