
class Boat {
  ArrayList<Pixel> pixels, rotatedPixels;
  Vector position, velocity, acceleration;
  int width, height;
  float angle, speed;
  public Boat() {
    pixels = new ArrayList<Pixel>();
    position = new Vector(0, 0);
    velocity = new Vector(0, 0);
    acceleration = new Vector(0, 0);
  }
  public void add(Pixel p) {
    pixels.add(p);
  }
  public void draw() {
    for (Pixel p : rotatedPixels)
      p.draw(round(getX(position.x)) - this.width/2, round(getY(position.y)) - this.height/2);
    velocity.add(acceleration);
    position.add(velocity);
  }
  void rotatePixels() {
    performRotation();
    orient();
  }
  void performRotation() {
    rotatedPixels = new ArrayList<Pixel>();
    for (Pixel p : pixels)
      rotatedPixels.add(p.getRotated(angle));
  }
  public void rotate(float theta) {
    angle += theta;
    rotatePixels();
  }
  public void modifySpeed(float s) {
    speed += s;
    orient();
  }
  public void orient() {
    velocity = new Vector(1, 0);
    velocity.rotate(-angle);
    velocity.scale(speed);
    //angle = velocity.angle();
    //performRotation();
  }
  public void drawMarker() {
    boat.velocity.drawMarker(position.x, position.y, color(255, 0, 0));
  }
}

PImage b;
Boat boat;
Field field;

void boatSetup() {
  b = loadImage("boat.png");
  int w = b.width, h = b.height;
  float m = 0.2;
  b.resize((int)(m * w), (int)(m * h));
  boat = new Boat();
  boat.width = b.width;
  boat.height = b.height;
  int x, y;
  for (int index = 0; index < b.pixels.length; index++)
    if (b.pixels[index] < 0) {
      // formula : index = x + y * width
      x = index % b.width;
      y = (index - x) / b.width;
      boat.add(new Pixel(x, y, b.pixels[index]));
    }
  boat.rotatePixels();
  boat.position = new Vector(xMin, 0);
  boat.velocity = new Vector(2.25, 2);
  field = new Field(new Vector(0, -2));
}

void boat() {
  field.draw();
  boat.draw();
  boat.drawMarker();
  //boat.angle += 0.00001;
  //boat.rotatePixels();
  //show(""+boat.angle);
}
