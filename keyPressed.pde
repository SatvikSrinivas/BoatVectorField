
float angleOfRotation = PI/100, speedChange = 0.5;

void keyPressed() {
  switch (keyCode) {
  case LEFT:
    boat.rotate(-angleOfRotation/2);
    break;
  case RIGHT:
    boat.rotate(angleOfRotation/2);
    break;
  case UP:
    boat.modifySpeed(speedChange);
    break;
  case DOWN:
    boat.modifySpeed(-speedChange);
    break;
  }
  switch (key) {
  case 'a':
    axes = !axes;
    break;
  case 'r':
    boat.rotate(angleOfRotation);
    break;
  case 'R':
    boat.rotate(-angleOfRotation);
    break;
  case 'm':
    showMouseCoordinates = !showMouseCoordinates;
    break;
  case 'z':
    showZoom = !showZoom;
    break;
  }
}

void show (String s) {
  fill(255);
  float k = 40;
  textSize(k);
  text(s, k/4, k);
}
