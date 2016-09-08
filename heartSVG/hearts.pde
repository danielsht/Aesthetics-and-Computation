class hearts {
  PShape heart;
  PVector pos;
  PVector size;
  float rotY = 0;

  hearts() {
    heart = loadShape("Heart.svg");
  }

  hearts(PVector pos, PVector size) {
    this.pos = pos;
    this.size = size;
    heart = loadShape("HeartHeavyStroke.svg");
  }

  void render() {
    //pushMatrix();
    //translate(pos.x, pos.y, 0);
    //rotateY(rotY);
    shapeMode(CENTER);
    shape(heart, pos.x, pos.y, size.x, size.y);
    //popMatrix();
    //if (rotY >= TWO_PI) {
    //  rotY = 0;
    //} else {
    //  rotY += 0.01;
    //}
  }
}