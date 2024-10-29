int firstSensor = 0;    // first analog sensor
int secondSensor = 0;   // second analog sensor
int thirdSensor = 0;    // digital sensor
int inByte = 0;         // incoming serial byte
#include <SharpIR.h>
#define pirSensor1 2

SharpIR sharp1( SharpIR::GP2Y0A41SK0F, A0 );
SharpIR sharp2( SharpIR::GP2Y0A41SK0F, A1 );

void setup() {
  // start serial port at 9600 bps:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  pinMode(pirSensor1, INPUT);
  establishContact();
}
void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    firstSensor = sharp1.getDistance();
    delay(10);
    secondSensor = sharp2.getDistance();
    delay(10);
    thirdSensor = (digitalRead(pirSensor1));
    Serial.write(firstSensor);
    Serial.write(secondSensor);
    Serial.write(thirdSensor);

  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}
