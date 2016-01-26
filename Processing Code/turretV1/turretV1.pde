/* 
Project: Physical Computing
By Walter Lim
Version 1 Turret

tests if turret fire noise is triggered when K key is pressed
*/

PImage a;  // Declare variable "a" of type PImage
import ddf.minim.*;
Minim minim;
AudioSample fire;
AudioSample snare;
void setup() {
  
  minim = new Minim(this);
  
    
  
  fire = minim.loadSample( "Turret_turret_fire_4x_03.wav");
  
}
 
void draw()

{}

  void keyPressed()

{
 if ( key == 'k' ) {fire.trigger();} 
}

