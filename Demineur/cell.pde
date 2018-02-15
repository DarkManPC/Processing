class cell {

  int x, y, l;

  cell(int x, int y, int l) {
    this.x = x;
    this.y = y;
    this.l = l;
  }
  
  float r = random(1);

  boolean mine = r < 0.15;
  boolean reveal = false;
  
  void revealCell(){
    reveal = true;
  }
  
}