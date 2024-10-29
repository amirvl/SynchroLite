import java.awt.*;
Robot robot;
import processing.serial.*;
import mqtt.*;

MQTTClient client;

Serial myPort;  
int val;   
float distance1, distance2, motion1;

void setup() {
  client = new MQTTClient(this);
  client.connect("mqtt://datt2010try:3qNNnmbOaEWfFx2R@datt2010try.cloud.shiftr.io", "p5-receive");
  
  String portName = Serial.list()[3];
  print("Serial ports: ");
  println(Serial.list());
  print("Chose ");
  print(portName);
  //Try to open this port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(0);
  myPort.write('V'); 
  myPort.write((byte) distance1);
  myPort.write((byte) distance2);
  myPort.write((byte) motion1);
}

void clientConnected() {
  println("client connected");
  client.subscribe("/distance1");
  client.subscribe("/distance2");
  client.subscribe("/motion1");
  
}

void messageReceived(String topic, byte[] payload) {
  println("new message: " + topic + " - " + new String(payload));
  if (topic.equals("/distance1")) {
    distance1 = float(new String(payload));
  }
  if (topic.equals("/distance2")) {
    distance2 = float(new String(payload));
  }
  if (topic.equals("/motion1")) {
    motion1 = float(new String(payload));
  }
}

void connectionLost() {
  println("connection lost");
}
