int scale = 20;
int k = 0;

void setup() {
  size(800, 800); 
  pixelDensity(displayDensity());
  frameRate(2);
}

void draw() {
  background(1);
  for (int i = 0; i < width/scale; i++)
  {
    for (int j = 0; j < height/scale; j++) 
    { 
      DrawLine(int(random(150,256)), j, i, random(1), abs(sin(radians(k))), i*(255/(height/scale)), j*(255/(height/scale)));
    }
  }
  
  if (k == 355){
    k = 0;
  }
  else{
    k += 5;
  }
  //noLoop();
}

void DrawLine(int alpha, int row, int col, float angle, float prob, int red, int green) {
  stroke(red, green, 255-red, alpha);
  noFill();
  if (angle <= prob){
    line(scale*row, scale*col, scale*row, scale*(col+1));
  }
  else{
    line(scale*row, scale*col, scale*(row+1), scale*col);
  }
}