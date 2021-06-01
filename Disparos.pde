class Disparos{
  
  float posX;
  float posY;
  
  boolean impacto;
  
  Disparos(float posXinicial, float posYinicial){  
    posX = posXinicial;
    posY = posYinicial;
    
    impacto = false;
    
  }
 
  void dibujar(){
    if(impacto == false){
    
    strokeWeight(5);
    stroke(#FF8811);
    line(posX, posY, posX + 0, posY + 10);
    noStroke();
    }
   
  }    
  
  void moverse(){
    posY = posY - 7;
  }
  
  void impactoAlien(){
    impacto = true;
  }
}
