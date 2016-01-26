const int motorLED[] = {11, 12, 13 };
const int MOTOR_LEDS = (sizeof(motorLED) / sizeof(motorLED[0]));

void setup()
{
  serial begin(9600);
  
  for ( int i = 0; i < MOTOR_LEDS ; i++ )
  {
    int pin = pinLED[i];
    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW); //system off
  }
}

void loop()
if ( Serial.available() >= 2 )
{
  int ledNo  = Serial.read() - 
//  
//  void setup() {
//  // initialize the digital pins as outputs.
//  pinMode(11, OUTPUT);    // "A"
//  pinMode(12, OUTPUT);    // "B"
//}
//
//void loop() {
//  digitalWrite(8, HIGH);   // begin motion
//  digitalWrite(9, LOW);
//  delay(2000);              // wait for two seconds
//  digitalWrite(8, LOW);    // change directions
//  digitalWrite(9, HIGH);
//  delay(1000);              // wait for one second
//}
