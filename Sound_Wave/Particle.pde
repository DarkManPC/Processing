class particle {
  float X;
  float Y;

  particle(Point p) {
    this.X = p.x;
    this.Y = p.y;
  }
  
  void show(){
    point(250,350);
  }
}