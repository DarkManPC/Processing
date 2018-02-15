int BG = 100;
Point center = new Point(0,0);

void setup() {

  size(500, 700);
  surface.setResizable(true);
  pixelDensity(displayDensity());
  background(BG);
  center.x = width/2;
  center.y = height/2;
}

void draw() {
  cercle();
  
}

void cercle() {

  int D = 0;

  if (width >= height) {
    D = height;
  } else {
    D = width;
  }
  fill(255-BG);
  ellipse(width/2, height/2, D, D);
}