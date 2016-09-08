PShape s;
int numHeart = 45;
hearts[] hearts = new hearts[numHeart];

void setup(){
  size(1280, 800);
  //size(800, 800, P3D);
  //lights();
  for (int i = 0; i < numHeart; i++) {
    PVector pos = new PVector(random(0, 400), random(0, 400));
    float rSize = random(0, 250);
    PVector size = new PVector(rSize, rSize);
    PVector push = new PVector(random(0, 3.5), random(0,3.5));
    hearts[i] = new hearts(pos, push, size);
  }
}

void draw(){
  background(0);
  for (int i = 0; i < numHeart; i++){
    hearts[i].verlet();
    hearts[i].render();
    hearts[i].boundsCollision();
  }
}