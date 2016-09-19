function IKJoints(){
	this.joint = new Array(4);
	this.jointCount = 4;
	this.lineLength = 100;

	for (var i = 0; i < this.jointCount; i++) {
        this.joints[i] = {
        	x: this.lineLength*i,
        	y: 0
        }
    }

    this.IKPoints = function() {

    	for (var i = this.joints.length - 2; i >= 0; i--) {
        	var theta = atan2(this.joints[i+1].y - this.joints[i].y, this.joints[i+1].x - this.joints[i].x);
        	this.joints[i].x = this.joints[i+1].x - cos(theta) * this.lineLength;
        	this.joints[i].y = this.joints[i+1].y - sin(theta) * this.lineLength;
    	}
    }

    this.drawPoints = function() {
    	beginShape();
    	for (var i = 0; i < this.joints.length; i++) {
        	vertex(this.joints[i].x, this.joints[i].y);
    	}
    	endShape();
    	fill(255);
    	for (var i = 0; i < this.joints.length; i++) {
        	ellipse(this.joints[i].x, this.joints[i].y, 5, 5);
    	}

    }

    this.move = function(xpos, ypos) {
    	this.joints[joints.length-1].x = xpos;
        this.joints[joints.length-1].y = ypos;
    }
}