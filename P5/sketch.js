var j0, j1, j2, j3;
var lineLength, centerX, centerY;
var joints = [];
var jointCount;
var mx, my;
var isDraggable;

function setup() {
    createCanvas(windowWidth, windowHeight); //make panel to draw on in the site
    centerX = width/2;
    centerY = height/2;
    lineLength = 100;
    jointCount = 4;
    for (var i = 0; i < jointCount; i++) {
        joints[i] = createVector(lineLength*i, 0);
    }
}

function draw() {
    background(100);
    noFill();
    mx = mouseX - centerX;
    my = mouseY - centerY;
    translate(centerX, centerY);
    IkPoints();
    drawPoints();
}

function IkPoints() {
    for (var i = joints.length - 2; i >= 0; i--) {
        var theta = atan2(joints[i+1].y - joints[i].y, joints[i+1].x - joints[i].x);
        joints[i].x = joints[i+1].x - cos(theta) * lineLength;
        joints[i].y = joints[i+1].y - sin(theta) * lineLength;
    }

    if(isDraggable) {
        joints[joints.length-1].x = mx;
        joints[joints.length-1].y = my;
    }

}

function drawPoints(){
    beginShape();
    for (var i = 0; i < joints.length; i++) {
        vertex(joints[i].x, joints[i].y);
    }
    endShape();
    fill(255);
    for (var i = 0; i < joints.length; i++) {
        ellipse(joints[i].x, joints[i].y, 5, 5);
    }
}

function mousePressed() {
    if (dist(mx, my, joints[joints.length-1].x, joints[joints.length-1].y) < 5){
        isDraggable = true;
    }
}

function mouseReleased() {
    isDraggable = false;
}
