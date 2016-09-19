//socket and server code taken from Daniel Shiffman's youtube series Shared Drawing Canvas https://www.youtube.com/watch?v=i6eP1Lw4gZk
//IK Chain code taken from Ira's class example 

var lineLength, centerX, centerY;
var joints = [];
var jointCount;
var mx, my;


var socket;

function setup() {
    createCanvas(windowWidth, windowHeight); //make panel to draw on in the site
    background(204, 255, 204);
    centerX = width/2;
    centerY = height/2;
    lineLength = 100;
    jointCount = 4;
    for (var i = 0; i < jointCount; i++) {
        joints[i] = createVector(lineLength*i, 0);
    }
    
    //change to whatever ip the local host is using
    socket = io.connect('http://10.8.155.36:5000');
    socket.on('mouse', function(data){
        console.log("Got: " + data.x + " " + data.y);
        joints[joints.length-1].x = data.x;
        joints[joints.length-1].y = data.y;
    })
}

function draw() {
    if (frameCount % 1800 === 0) {
        background(204, 255, 204);
    }
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

}

function drawPoints(){
    strokeWeight(4);
    stroke(250, 128, 114);
    beginShape();
    for (var i = 0; i < joints.length; i++) {
        vertex(joints[i].x, joints[i].y);
    }
    endShape();
    // fill(255);
    // for (var i = 0; i < joints.length; i++) {
    //     ellipse(joints[i].x, joints[i].y, 5, 5);
    // }
}

function mouseDragged() {
    joints[joints.length-1].x = mx;
    joints[joints.length-1].y = my;
    sendmouse(mx, my);
}

function sendmouse(xpos, ypos){
    var data = {
        x: xpos,
        y: ypos
    };
    socket.emit('mouse', data);
}