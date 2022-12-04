
float xMin, xMax, yMin, yMax;

void randomBounds() {
  xMin = random(-1000, -500);
  xMax = random(500, 1000);
  yMin = random(-1000, -500);
  yMax = random(500, 1000);
}

void defaultBounds() {
  xMin = -displayWidth/2;
  xMax = displayWidth/2;
  yMin = -displayHeight/2;
  yMax = displayHeight/2;
}

void applyStandardMultiplier(float m) {
  defaultBounds();
  applyMultiplier(m);
}

void applyMultiplier(float m) {
  xMin *= m;
  xMax *= m;
  yMin *= m;
  yMax *= m;
}

void setBounds(float f) {
  xMin = -f;
  xMax = f;
  yMin = -f;
  yMax = f;
}

void setBounds(float xMin, float xMax, float yMin, float yMax) {
  this.xMin = xMin;
  this.xMax = xMax;
  this.yMin = yMin;
  this.yMax = yMax;
}

boolean axes;

void axes() {
  if (!axes)
    return;
  strokeWeight(2);
  stroke(255);
  xAxis();
  yAxis();
}

void setMultiplier () {
  float m1 = (xMax - xMin) / displayWidth;
  float m2 = (yMax - yMin) / displayWidth;
  multiplier = (m1 + m2) / 2.0;
}

float getX (float x) {
  return ((x - xMin) / (xMax - xMin)) * displayWidth;
}

float getY (float y) {
  return ((yMax - y)/(yMax - yMin)) * displayHeight;
}

float mouseX () {
  return mouseX * ((xMax - xMin)/(displayWidth)) + xMin;
}

float mouseY () {
  return -mouseY * ((yMax - yMin)/(displayHeight)) + yMax;
}

float invX (float x) {
  return (x / displayWidth) * (xMax - xMin) + xMin;
}

float invY (float y) {
  return -y * ((yMax - yMin)/(displayHeight)) + yMax;
}

void lineSegment (float x1, float y1, float x2, float y2) {
  line(getX(x1), getY(y1), getX(x2), getY(y2));
}

void vector (float x, float y) {
  line(getX (0), getY(0), getX(x), (getY(y)));
}

void xAxis() {
  lineSegment(xMin, 0, xMax, 0);
}

void yAxis() {
  lineSegment(0, yMin, 0, yMax);
}

boolean showMouseCoordinates = false;

void showMouseCoordinates() {
  if (!showMouseCoordinates)
    return;
  textSize(25);
  fill(0);
  String showMouseCoordinatesText = "("+mouseX()+", "+mouseY()+")";
  text(showMouseCoordinatesText, mouseX, mouseY);
}

float plotRadius = 5;

void plot(float x, float y) {
  noStroke();
  circle(getX(x), getY(y), plotRadius);
}

float increment, multiplier;
