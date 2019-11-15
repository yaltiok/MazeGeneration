class Cell {
  PVector pos = new PVector();
  int w;
  boolean[] walls = new boolean[4];

  Cell(PVector pos, int w) {
    this.pos = pos;
    this.w = w;
    for (int i = 0; i< this.walls.length; i++) {
      this.walls[i] = true;
    }
  }
  
  void highlight(){
    noStroke();
    fill(133,0,150);
    rect(pos.x,pos.y,w,w);
  }


  void show() {
    stroke(150);
    if (this.walls[0]) {
      line(pos.x, pos.y, pos.x + w, pos.y);
    }
    if (this.walls[1]) {
      line(pos.x + w, pos.y, pos.x + w, pos.y + w);
    }
    if (this.walls[2]) {
      line(pos.x + w, pos.y + w, pos.x, pos.y + w);
    }
    if (this.walls[0]) {
      line(pos.x, pos.y + w, pos.x, pos.y);
    }
  }

  void deleteWall(int index) {
    this.walls[index] = false;
  }
}
