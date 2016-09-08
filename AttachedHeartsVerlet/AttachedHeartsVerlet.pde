PShape s;
int numHeart = 46;
hearts[] hearts = new hearts[numHeart];
HeartString[] hStrings = new HeartString[numHeart];

void setup(){
  size(1280, 800);
  //size(800, 800, P3D);
  //lights();
  float tension = .02;
  for (int i = 0; i < numHeart; i++) {
    PVector pos = new PVector(random(0, 400), random(0, 400));
    float rSize = random(0, 250);
    PVector size = new PVector(rSize, rSize);
    PVector push = new PVector(random(0, 3.5), random(0,3.5));
    hearts[i] = new hearts(pos, push, size);
  }
  for (int i = 0; i < numHeart; i += 2){
    hStrings[i] = new HeartString(hearts[i], hearts[i+1], tension);
  }
}

void draw(){
  background(0);
  for (int i = 0; i < numHeart; i+=2) {
    hStrings[i].render(); //<>//
    hStrings[i].constrainLen();
  }
  for (int i = 0; i < numHeart; i++){
    hearts[i].verlet();
    hearts[i].render();
    hearts[i].boundsCollision();
  }
}