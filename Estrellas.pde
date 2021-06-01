//estrellas estaticas que aparecen de forma aleatoria en el espacio, son más
//que todo decorativas
class Estrellas{
float x[];
float y[];
int num = 100; 

Estrellas(){
  
  x = new float[num];
  y = new float[num];
  
    for(int k = 0; k < num; k = k + 1){
    x[k] = random(0, width); 
    y[k] = random(0, height); 
  }
  
 }
   
void pintarse(){
   for(int k = 0; k < num; k = k + 1){
     fill(#fffffc);
     ellipse(x[k], y[k], 8, 8); 
   }
  
}

void moverse(){
  for(int k = 0; k < num; k ++){
    y[k] = y[k] +  2;
    if(y[k] > height){
      y[k] = random(-50,-100);
    }
  }
}
}
