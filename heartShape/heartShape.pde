void setup(){
  size(400, 400);
  smooth();
  noStroke();
  fill(255, 0, 0);
}

void draw(){
  beginShape();
  vertex(50, 15);
  bezierVertex(50, -5, 90, 5, 50, 40);
  vertex(50, 15);
  bezierVertex(50, -5, 10, 5, 50, 40);
  endShape();
}