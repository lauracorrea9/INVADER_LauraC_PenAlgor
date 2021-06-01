//Son los jugadores, tienen que esquivar los gusanos y matar los aliens para salvar 
//los planetas para que no los invadan 
class Naves{
  float posX;
  float posY;
  float velNave;
  
 //movimiento en eje Y
  float movY;
  
  float movX;
  
  color colorNave;
  
  int pttamNave1;
  int pttamNave2;
  int pttamNave3;
  int pttamNave4;
  
  boolean toco;
  
  Naves(float posX1, float posY1, int tamNave1, int tamNave2, int tamNave3, 
  int tamNave4, float velNave1, color color1){
    posX = posX1;
    posY = posY1;
    
    colorNave = color1;
    
    //coordenadas de las puntas de las naves 
    velNave = velNave1;
    pttamNave1 = tamNave1;
    pttamNave2 = tamNave2;
    pttamNave3 = tamNave3;
    pttamNave4 = tamNave4;
    
    //toco = false;
    
  }
  void pintarse(){
    fill(colorNave);
    triangle(posX + movX, posY + movY, pttamNave1 + movX, pttamNave2 + movY, 
    pttamNave3 + movX, pttamNave4 + movY);
    
    //stroke(255, 0 ,0);
    //strokeWeight(5);
    //point((posX + movX) + 26, (posY + movY) - 22);
    //noStroke();
  }
     
     void moverarriba(){
       
      movY = movY - velNave; 
       
     }
     
     void moverabajo(){
       
       movY = movY + velNave; 
       
     }
     
     void moverizq(){
       
       movX = movX - velNave;
       
     }
     
     void moverdere(){
       
       movX = movX + velNave;
       
     }
     
     //void tocoNave(){
     //  toco = true;
     //}
  }
