
boolean showZoom;

void showZoom() {
  if (!showZoom)
    return;
  int k = 120, dim = 2, shift = k/3;
  strokeWeight(50 / k);
  for (int i = -k; i < k; i++)
    for (int j = -k; j < k; j++) {
      fill(get(mouseX + i, mouseY+j));
      square(shift + (i + k) * dim, shift + (j + k) * dim, dim);
    }
  strokeWeight(1.5);
  stroke(0);
  noFill();
  square(shift, shift, 2 * k * dim);
  noFill();
  square(mouseX - k * dim / 2, mouseY - k * dim / 2, k * dim);
}
