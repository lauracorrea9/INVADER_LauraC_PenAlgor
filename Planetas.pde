//Por lo que luchan las naves, ellas los protejen 
class Planeta{
  float posX;
  float posY;
  int distanciaAlSol;
  float anguloGiro;
  float velocidadGiro;
  
  color colorPlaneta;
  int radioPlaneta;
  
  Planeta(float posicionXInicial, float posicionYInicial, int distanciaAlSolInic, float velocidadGiroInic, color colorInicial, int radioPInic ){
    posX = posicionXInicial;
    posY = posicionYInicial;
    distanciaAlSol = distanciaAlSolInic;
    
    anguloGiro = 0;
    velocidadGiro = velocidadGiroInic;
    
    colorPlaneta = colorInicial;
    radioPlaneta = radioPInic;
  }
  
  void moverse(float mov){
    posX = distanciaAlSol*sin(radians(velocidadGiro*mov));
    posY = distanciaAlSol*cos(radians(velocidadGiro*mov));
  }
  
  void pintarse(){
    fill(colorPlaneta);
    ellipse(posX+(width/2),posY+(height/2),radioPlaneta,radioPlaneta);
  }
}
