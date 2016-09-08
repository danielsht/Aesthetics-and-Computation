final String SD = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202487889&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
final String Dallas = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202388929&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
final String NY = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202459115&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
final String Chicago = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%202379574&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
float rotY = 0;
int sdTemp;
int dTemp;
int nyTemp;
int chiTemp;

JSONBS json;

void setup(){
  json = new JSONBS();
  sdTemp = json.getTemp(SD);
  dTemp = json.getTemp(Dallas);
  nyTemp = json.getTemp(NY);
  chiTemp = json.getTemp(Chicago);
  
  size(400, 400, P3D);
  background(0);
  lights();
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  stroke(255);
  rotateY(rotY);
  rotateZ(-PI/6);
  
  beginShape();
  vertex(sdTemp, sdTemp, sdTemp);
  vertex(dTemp, dTemp, dTemp);
  vertex(nyTemp, nyTemp, nyTemp);
  vertex(chiTemp, chiTemp, chiTemp);
  endShape(CLOSE);
  if (rotY >= TWO_PI) {
    rotY = 0;
  } else {
    rotY += 0.01;
  }
}