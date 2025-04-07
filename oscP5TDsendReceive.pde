/**
 * oscP5sendreceive by andreas schlegel, adapted by Jake Tan 2025
 * example shows how to send and receive osc messages, adapted for TouchDesigner OSC In/Out
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);

  // Receive from TD OSC Out CHOP on 12000, ensure 127.0.0.1 or localhost is selected if on only 1 PC
  oscP5 = new OscP5(this,12000);

  // Send to TD OSC In CHOP on 10000, ensure 127.0.0.1 or localhost is selected if on only 1 PC
  myRemoteLocation = new NetAddress("127.0.0.1", 10000);
}

void draw() {
  background(0);  
}

void mousePressed() {
  OscMessage myMessage = new OscMessage("/mouseClick"); // Channel Name would be mouseClick on TD
  myMessage.add(mouseX); // You can send X or Y or both, removing would send only 1 value
  myMessage.add(mouseY);
  oscP5.send(myMessage, myRemoteLocation);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  String addr = theOscMessage.addrPattern();

  if (addr.equals("/v1")) {
    float val = theOscMessage.get(0).floatValue(); // Value received from TD
    println("Received value on /v1: " + val);
  } else {
    println("Received message: " + addr);
  }
}
