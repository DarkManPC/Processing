int l = 30 ;
int sw = 801;
int sh = 801;
int w = sw / l;
int h = sh / l;

boolean perdu = false;
boolean gagne = true;


void setup() {
  size(801, 801);
  pixelDensity(2);
  background(255);
  frameRate(30);
}

cell[][] grid = createGrid();

void draw() {
  //println(frameRate);
  jeu();
}

void jeu(){
gagne = true;
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      if (!grid[i][j].mine && !grid[i][j].reveal) {
        gagne = false;
      }
    }
  }
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      show(grid[i][j], grid[i][j].x, grid[i][j].y);
      blank(i, j);
      if (!grid[i][j].mine && !grid[i][j].reveal) {
        gagne = false;
      }
    }
  }
}

cell[][] createGrid() {
  cell[][] grid = new cell[w][h];
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      grid[i][j] = new cell (i, j, l);
    }
  }
  return grid;
}

void show(cell c, int x, int y) {
String fin = new String();
  if (perdu || gagne) {
    if (perdu){
    fin = "PERDU";
    }
    else {
    fin = "GAGNER";
    }
    if (c.mine) {
      c.revealCell();
      fill(0);
      textSize(sw/4);
      textAlign(CENTER, CENTER);
      text(fin, sw/2, sh/2);
    }
  }

  if (c.reveal) {

    fill(255);
    stroke(0);
    rect(x*l, y*l, l, l);

    if (c.mine) {
      fill(100);
      noStroke();
      ellipse(x*l+l/2, y*l+l/2, l/2, l/2);
    } else {
      if (neighbour(c) != 0) {
        fill(100);
        textSize(l - (l/5));
        textAlign(BASELINE);
        text(Integer.toString(neighbour(c)), x*l+l/4, (y+1)*l-(l/8));
      }
    }
  } else {

    fill(160);
    stroke(0);
    rect(x*l, y*l, l, l);
  }
}

int neighbour(cell c) {
  int resultat = 0, x = 0, y = 0;
  if (c.x != 0) {
    x = c.x - 1;
  }
  if (c.y != 0) {
    y = c.y - 1;
  }
  for (int i = x; i < c.x+2 && i < w; i++) {
    for (int j = y; j < c.y+2 && j < h; j++) {
      if (grid[i][j].mine) {
        resultat++;
      }
    }
  }
  return resultat;
}

void mouseClicked() {
  int X = mouseX / l;
  int Y = mouseY / l;

  grid[X][Y].revealCell();

  perdu = grid[X][Y].mine;
}

void blank(int x, int y) {
  if (neighbour(grid[x][y]) == 0 && grid[x][y].reveal) {
    int X = 0, Y = 0;
    if (x != 0) {
      X = x - 1;
    }
    if (y != 0) {
      Y = y - 1;
    }
    for (int i = X; i < x+2 && i < w; i++) {
      for (int j = Y; j < y+2 && j < h; j++) {
        grid[i][j].revealCell();
      }
    }
  }
}