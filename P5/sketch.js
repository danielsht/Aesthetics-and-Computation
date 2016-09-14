var lineLength, centerX, centerY;

function setup() {
    createCanvas(windowWidth, windowHeight); //make panel to draw on in the site
    centerY = height/2;
    centerX = width/2;
    lineLength = 100;
}

function draw() {
    background(100);
    ellipse(centerX, centerY, 10, 10);
    var a = atan2(mouseY - centerY, mouseX - centerX);
    var newX = centerX + cos(a) * lineLength;
    var newY = centerY + sin(a) * lineLength;
    ellipse(newX, newY, 10, 10);
    a = atan2(newY, newX);
    newX = newX + cos(a) * lineLength;
    newY = newY + sin(a) * lineLength;
    ellipse(newX, newY, 10, 10);

}