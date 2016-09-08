Table table; //<>//
float rotX = PI/2;
float rotY = 0;
float noD;
float D0;
float D1;
float D2;
float D3;
float D4;

void setup() {
  size(400, 400, P3D);
  background(0);
  lights();

  //CSV file from http://droughtmonitor.unl.edu/MapsAndData/GISData.aspx
  table = loadTable("dm_export_state_20160823.csv", "header");
  for (TableRow row : table.rows()) {
    noD += map(row.getFloat("Nothing"), 0, 100, -100, 100);
    D0 += map(row.getFloat("D0"), 0, 100, -100, 100);
    D1 += map(row.getFloat("D1"), 0, 100, -100, 100);
    D2 += map(row.getFloat("D2"), 0, 100, -100, 100);
    D3 += map(row.getFloat("D3"), 0, 100, -100, 100);
    D4 += map(row.getFloat("D4"), 0, 100, -100, 100);
  }

  //Averages
  noD /= table.getRowCount();
  D0 /= table.getRowCount();
  D1 /= table.getRowCount();
  D2 /= table.getRowCount();
  D3 /= table.getRowCount();
  D4 /= table.getRowCount();
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  stroke(255);
  fill(232, 21, 21);
  //rotateX(rotX);
  rotateY(rotY);
  rotateZ(-PI/6);

  beginShape();
  vertex(noD, D0, D1);
  vertex( D2, D3, D4);
  vertex(   D4, D3, D2);

  vertex( D1, D0, noD);
  vertex( D4, D1, D0);
  vertex(   D3, D2, noD);

  vertex( noD, noD, noD);
  vertex(D0, D0, D0);
  vertex(   D1, D1, D1);

  vertex(D2, D2, D2);
  vertex(D3, D3, D3);
  vertex(   D4, D4, D4);
  endShape(CLOSE);
  
  if (rotY >= TWO_PI) {
    rotY = 0;
  } else {
    rotY += 0.01;
  }
}