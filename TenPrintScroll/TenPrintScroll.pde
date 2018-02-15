int scale = 5;
int k = 0;
int[][] alpha;
float[][] angle;
float[][] prob;


void setup() {
  size(800, 800); 
  pixelDensity(displayDensity());
  frameRate(30);
  alpha = new int[(height/scale)+1][(width/scale)+1];
  angle = new float[(height/scale)+1][(width/scale)+1];
  prob = new float[(height/scale)+1][(width/scale)+1];
}

void draw() {
  background(1);
  
  for (int j = alpha[0].length-2; j >= 0; j --){
    for (int i = 0; i < alpha.length; i ++){
     alpha[i][j+1]=alpha[i][j]; 
     angle[i][j+1]=angle[i][j]; 
     prob[i][j+1]=prob[i][j];
    }
  }
  
  for (int i = 0; i < alpha.length; i ++){
     alpha[i][0]=int(random(150,256)); 
     angle[i][0]=random(1); 
     prob[i][0]= abs(sin(radians(k))); 
    }
  
  for (int i = 0; i < width/scale; i++)
  {
    for (int j = 0; j < height/scale; j++) 
    { 
      DrawLine(alpha[j][i], i, j, angle[j][i], prob[j][i], /*i*(255/(height/scale))*/40, /*j*(255/(height/scale))*/ 150);
    }
  }
  
  if (k == 359){
    k = 0;
  }
  else{
    k += 1;
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