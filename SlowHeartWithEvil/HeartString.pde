//Taken from verlet_integration_04 example problem
class HeartString {
  hearts h1, h2;
  float stiffness;
  
  PVector vecOrig;
  float len;
  
  HeartString(){
  }
  
  HeartString(hearts h1, hearts h2, float stiffness){
    this.h1 = h1;
    this.h2 = h2;
    this.stiffness = stiffness;
    vecOrig = new PVector(h2.pos.x - h1.pos.x, h2.pos.y - h1.pos.y);
    len = dist(h1.pos.x, h1.pos.y, h2.pos.x, h2.pos.y);
  }
  
  void render(){
    stroke(255);
    beginShape(); //<>//
    vertex(h1.pos.x, h1.pos.y); //<>//
    vertex(h2.pos.x, h2.pos.y); //<>//
    endShape(); //<>//
  }
  
  void constrainLen(){
    PVector delta = new PVector(h2.pos.x - h1.pos.x, h2.pos.y - h2.pos.y);
    float deltaLength = delta.mag();
    float difference = ((deltaLength - len) / deltaLength);
    h1.pos.x += delta.x * (0.5f * stiffness * difference);
    h1.pos.y += delta.y * (0.5f * stiffness * difference);
    h2.pos.x -= delta.x * (0.5f * stiffness * difference);
    h2.pos.y -= delta.y * (0.5f * stiffness * difference);
  }

}