
class Vector {
  private float x, y;

  public Vector (float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void add(Vector v) {
    x += v.x;
    y += v.y;
  }

  public void scale(float f) {
    x *= f;
    y *= f;
  }

  public Vector getScaled(float f) {
    return new Vector (f * x, f * y);
  }

  public float magnitude() {
    return sqrt(x*x + y*y);
  }

  public Vector unit() {
    return getScaled(1/magnitude());
  }

  public void set(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void set (Vector v) {
    set(v.x, v.y);
  }

  public void rotate(float theta) {
    float xStar = x, yStar = y;
    x = xStar * cos(theta) - yStar * sin(theta);
    y = xStar * sin(theta) + yStar * cos(theta);
  }

  public Vector getRotated(float theta) {
    float x, y, xStar = this.x, yStar = this.y;
    x = xStar * cos(theta) - yStar * sin(theta);
    y = xStar * sin(theta) + yStar * cos(theta);
    return new Vector (x, y);
  }

  public void translate(float x, float y) {
    this.x += x;
    this.y += y;
  }

  // bug fix potentially required (not entirely sure if this method is working as intended)
  public float angle() {
    float angle = atan(y/x);
    if (x <= 0)
      angle += PI;
    return angle;
  }

  public String toString() {
    return "<"+x+", "+y+"> ("+magnitude()+")";
  }

  public void showVectorInfo() {
    show(this.toString());
  }

  public void drawLine() {
    drawLine(0, 0);
  }

  public void drawLine (float xShift, float yShift) {
    strokeWeight(3);
    stroke(0);
    lineSegment(xShift, yShift, x + xShift, y + yShift);
  }

  public void drawArrowHead() {
    drawArrowHead(0, 0);
  }

  public void drawArrowHead(float xShift, float yShift) {
    drawArrowHead(xShift, yShift, color(255));
  }

  public void drawArrowHead(float xShift, float yShift, color c) {
    Vector u = this.unit(), v = u.getRotated(PI/1.5), w = u.getRotated(-PI/1.5);
    float dim = 25;
    u.scale(dim);
    v.scale(dim);
    w.scale(dim);
    u.translate(x, y);
    v.translate(x, y);
    w.translate(x, y);
    fill(c);
    stroke(0);
    Vector x = u.getScaled(-2.5);
    lineSegment(x.x + xShift, x.y+ yShift, u.x + xShift, u.y+ yShift);
    triangle(getX(u.x + xShift), getY(u.y + yShift), getX(v.x + xShift), getY(v.y + yShift), getX(w.x + xShift), getY(w.y + yShift));
  }
  
  public void drawMarker(float xShift, float yShift, color c) {
    Vector u = this.unit(), v = u.getRotated(PI/1.5), w = u.getRotated(-PI/1.5);
    float dim = 15;
    u.scale(2 * dim);
    v.scale(0.75 * dim);
    w.scale(0.75 * dim);
    u.translate(x, y);
    v.translate(x, y);
    w.translate(x, y);
    fill(c);
    stroke(0);
    triangle(getX(u.x + xShift), getY(u.y + yShift), getX(v.x + xShift), getY(v.y + yShift), getX(w.x + xShift), getY(w.y + yShift));
  
  }

  public void draw() {
    drawLine();
    drawArrowHead();
  }

  public void draw(float xShift, float yShift) {
    drawLine(xShift, yShift);
    drawArrowHead(xShift, yShift);
  }
  
  public void draw(float xShift, float yShift, color c) {
    drawArrowHead(xShift, yShift, c);
  }
}
