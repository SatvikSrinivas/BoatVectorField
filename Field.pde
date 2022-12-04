
class Field {

  Vector v;

  // currently only supports constant velocity field
  public Field(Vector v) {
    this.v = v;
  }

  public void apply() {
    boat.position.add(v);
  }

  public void draw() {
    int k = 10;
    for (float x = xMin; x <= xMax; x+=(xMax-xMin)/k)
      for (float y = yMin; y <= 2*yMax; y+=(yMax-yMin)/k)
        v.draw(x, y);
    apply();
  }
}
