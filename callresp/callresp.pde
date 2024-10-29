import processing.serial.*;
import mqtt.*;

MQTTClient client;

  int motion1, distance1, distance2;
  int m1 = 0;
  Serial myPort;                       // The serial port
  int[] serialInArray = new int[3];    // Where we'll put what we receive
  int serialCount = 0;                 // A count of how many bytes we receive
  boolean firstContact = false;        // Whether we've heard from the microcontroller

  void setup() {
    client = new MQTTClient(this);
    client.connect("mqtt://datt2010try:3qNNnmbOaEWfFx2R@datt2010try.cloud.shiftr.io", "processing");

   
    distance1 = width / 2;
    distance2 = height / 2;

    
    println(Serial.list());
    
    String portName = Serial.list()[8];
    myPort = new Serial(this, portName, 9600);
  }

  void draw() {
  }

  void serialEvent(Serial myPort) {
    
    int inByte = myPort.read();
    
    if (firstContact == false) {
      if (inByte == 'A') {
        myPort.clear();          // clear the serial port buffer
        firstContact = true;     // you've had first contact from the microcontroller
        myPort.write('A');       // ask for more
      }
    }
    else {
     
      serialInArray[serialCount] = inByte;
      serialCount++;

      
      if (serialCount > 2 ) {
        distance1 = serialInArray[0];
        distance2 = serialInArray[1];
        motion1 = serialInArray[2];

        
        println(distance1 );
        println(distance2 );
        
        if (motion1 >= 1){
         client.publish("/motion1", str(motion1)); 
         delay (100);
        }else if(motion1 < 1){
         client.publish("/motion1", str(m1));
        }
        
        if (distance1 <= 300){
        client.publish("/distance1", str(distance1));
        delay (100);
        }
        
        if (distance2 <= 300){
        client.publish("/distance2", str(distance2));
        delay (100);
        }

 
        myPort.write('A');
        serialCount = 0;
      }
    }
  }
  
  void messageReceived(String topic, byte[] payload) {
  println( topic + ": " + new String(payload));
}
