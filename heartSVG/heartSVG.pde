PShape s;
int numHeart = 45;
hearts[] hearts = new hearts[numHeart];

void setup(){
  size(400, 400);
  //size(800, 800, P3D);
  //lights();
  for (int i = 0; i < numHeart; i++) {
    PVector pos = new PVector(random(0, 400), random(0, 400));
    float rSize = random(0, 250);
    PVector size = new PVector(rSize, rSize);
    hearts[i] = new hearts(pos, size);
  }
}

void draw(){
  background(0);
  for (int i = 0; i < numHeart; i++){
    hearts[i].render();
  }
}