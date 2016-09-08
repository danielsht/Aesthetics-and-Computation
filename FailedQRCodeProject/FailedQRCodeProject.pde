import processing.video.*;
import qrcodeprocessing.*;

Capture video;
String statusMsg;
float rotY = 0;

String QRStatus = "Waiting";

Decoder decoder;

void setup() {
  size(400, 400, P3D);
  video =new Capture(this, 320, 240);

  decoder = new Decoder(this);
}

void decoderEvent(Decoder decoder) {
  statusMsg = decoder.getDecodedString();
  println(statusMsg);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);

  if (QRStatus.equals("Waiting")) {
    image(video, 0, 0);
  } else if (QRStatus.equals("Cube")) {
    translate(58, 48, 0); 
    rotateY(rotY);
    noFill();
    box(100);
    if(rotY >= TWO_PI){
      rotY = 0;
    }
    else{
    rotY += 0.01;
    }
  }

  if (decoder.decoding()) {
    PImage show = decoder.getImage();
    image(show, 0, 0, show.width/4, show.height/4);
    statusMsg = "Decoding Image";
    for (int i = 0; i < (frameCount/2) % 10; i++) statusMsg += ".";
  }
}

void keyReleased() {
  switch (key) {
  case ' ':
    video.start();
    break;
  case 's':
    PImage savedFrame = createImage(video.width, video.height, RGB);
    savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    savedFrame.updatePixels();
    video.stop();

    decoder.decodeImage(savedFrame);
    break;
  }
}