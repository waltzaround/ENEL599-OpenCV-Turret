/*
  Blink
 Turns on an LED on for one second, then off for one second, repeatedly.
 
 Most Arduinos have an on-board LED you can control. On the Uno and
 Leonardo, it is attached to digital pin 13. If you're unsure what
 pin the on-board LED is connected to on your Arduino model, check
 the documentation at http://arduino.cc
 
 This example code is in the public domain.
 
 modified 8 May 2014
 by Scott Fitzgerald
 */

const int pinMotorEnable = 11;
const int pinMotorA = 12;
const int pinMotorB = 13;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 13 as an output.
  /*Al-Gore ManBearPig level super*/  Serial.begin(9600);


  pinMode(pinMotorEnable, OUTPUT);
  pinMode(pinMotorA, OUTPUT);
  pinMode(pinMotorB, OUTPUT);
}

void turnClockwise() {
  analogWrite(pinMotorEnable, 255);

  digitalWrite(pinMotorA, HIGH);
  digitalWrite(pinMotorB, LOW);
}

void turnCounterClockwise() {
  analogWrite(pinMotorEnable, 255);
  digitalWrite(pinMotorA, LOW);
  digitalWrite(pinMotorB, HIGH);
}

// the loop function runs over and over again forever
void loop() {
  if(Serial.available()) {
    char a = Serial.read();
    if(a) {
      // Face detected
      digitalWrite(pinMotorEnable, HIGH);
      digitalWrite(pinMotorA, HIGH);
      digitalWrite(pinMotorB, HIGH);
    } 
    else {
      //Face not detected
      analogWrite(pinMotorEnable, 255);
      digitalWrite(pinMotorA, HIGH);
      digitalWrite(pinMotorB, LOW);
    } 
  }
}



