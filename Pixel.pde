
class Pixel {
  int x, y;
  color c;
  public Pixel(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  public void draw(int x_0, int y_0) {
    fill(c);
    noStroke();
    circle(x + x_0, y + y_0, 2);
  }
  public void rotate(float theta) {
    // translate before rotation
    x -= boat.width/2;
    y -= boat.height/2;

    // perform rotation
    float xStar = x, yStar = y;
    x = round((xStar * cos(theta) - yStar * sin(theta)));
    y = round((xStar * sin(theta) + yStar * cos(theta)));

    // translate after rotation
    x += boat.width/2;
    y += boat.height/2;
  }

  public Pixel getRotated(float theta) {
    float x = this.x, y = this.y;
    x -= boat.width/2;
    y -= boat.height/2;

    float xStar = x, yStar = y;
    x = xStar * cos(theta) - yStar * sin(theta);
    y = xStar * sin(theta) + yStar * cos(theta);

    x += boat.width/2;
    y += boat.height/2;
    return new Pixel (round(x), round(y), c);
  }

  // https://gautamnagrawal.medium.com/rotating-image-by-any-angle-shear-transformation-using-only-numpy-d28d16eb5076
  public void rotate_ShearMethod(float theta) {
    // translate before shearing
    x -= boat.width/2;
    y -= boat.height/2;

    float xStar = x, yStar = y;

    // perform shear#1 (yStar remains unchanged)
    xStar = xStar - yStar * tan(theta/2);

    // perform shear#2 (xStar remains unchanged)
    yStar += xStar * sin(theta);

    // perform shear#3 (repeat of shear#1)
    xStar = xStar - yStar * tan(theta/2);

    x = round(xStar);
    y = round(yStar);

    // translate after shearing
    x += boat.width/2;
    y += boat.height/2;
  }
}
