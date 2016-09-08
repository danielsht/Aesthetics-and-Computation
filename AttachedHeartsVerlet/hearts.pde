class hearts {
  PShape heart;
  PVector pos, posOld;
  PVector size, push;
  float rotY = 0;

  hearts() {
    heart = loadShape("Heart.svg");
  }

  hearts(PVector pos, PVector push, PVector size) {
    this.pos = pos;
    this.size = size;
    this.posOld = new PVector(pos.x, pos.y);
    this.push = push;
    heart = loadShape("HeartNoBorder.svg");

    pos.add(push);
  }

  //taken from verlet_integration examples
  void verlet() {
    PVector posTemp = new PVector(pos.x, pos.y);
    pos.x += (pos.x-posOld.x);
    pos.y += (pos.y-posOld.y);
    posOld.set(posTemp);
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

  void boundsCollision() {
    if (pos.x>width-(size.x/2)) {
      pos.x = width-(size.x/2);
      posOld.x = pos.x;
      pos.x -= push.x;
    } else if (pos.x<(size.x/2)) {
      pos.x = (size.x/2);
      posOld.x = pos.x;
      pos.x += push.x;
    }

    if (pos.y<(size.y/2)) {
      pos.y = (size.y/2);
      posOld.y = pos.y;
      pos.y += push.y;
    } 

    if (pos.y>height-(size.y/2)) {
      pos.y = height-(size.y/2);
      posOld.y = pos.y;
      pos.y -= push.y;
    }
  }
}