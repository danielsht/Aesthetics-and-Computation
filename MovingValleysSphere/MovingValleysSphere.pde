//Sphere modified from Daniel Shiffman's Coding Rainbow Coding Challenges
//to be used with Perlin Noise.
//Dave Smith helped me with the mountains and valleys.
import peasy.*;

PeasyCam cam;

PVector[][] globe;
int total = 200;
float xOff, yOff, zOff;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  //colorMode(HSB);
  globe = new PVector[total+1][total+1];
  xOff = 0.0;
  yOff = 0.0;
}

void draw() {
  background(#FAE085);
  noStroke();
  rotateX(PI/2);
  lights();
  float r = 200;
  
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total+1; j++) {
      noiseDetail(16, 0.90);
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = (r + map(noise(xOff, yOff), 0, 1, 0, TWO_PI)) * sin(lat) * cos(lon);
      float y = (r + map(noise(xOff, yOff), 0, 1, 0, TWO_PI)) * sin(lat) * sin(lon);
      float z = (r + map(noise(xOff, yOff), 0, 1, 0, TWO_PI)) * cos(lat);
      globe[i][j] = new PVector(x, y, z);
      
      if(xOff == 0.04){
        xOff = 0.0;
        yOff = 0.0;
      } else {
        xOff += 0.01;
        yOff += 0.01;
      }
    }
  }

  //fill(255,165,0);
  for (int i = 0; i < total; i++) {
    //float hu = map(i, 0, total, 0, 255*6);
    fill(135, 206, 250);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}