
float m = 1;

void setup() {
  fullScreen();
  applyStandardMultiplier(m);
  setMultiplier();
  boatSetup();
}

color waterColor = color(0, 121, 226);

void draw() {
  background(waterColor);
  axes();
  boat();
  showMouseCoordinates();
  showZoom();
}
