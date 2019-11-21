class Cell {
  PVector pos = new PVector();
  int w;
  boolean[] walls = new boolean[4];
  boolean visited = false;
  ArrayList<Cell> neighbors = new ArrayList();

  Cell(PVector pos, int w) {
    this.pos = pos.mult(w);
    this.w = w;
    for (int i = 0; i< this.walls.length; i++) {
      this.walls[i] = true;
    }
  }

  //void highlight() {
  //  noStroke();
  //  rect(pos.x, pos.y, w, w);
  //}

  void addNeighbors(Cell c) {
    neighbors.add(c);
  }

  void clearNeighbors() {
    this.neighbors.clear();
  }

  void show() {
    stroke(255);
    if (this.walls[0]) {
      line(pos.x, pos.y, pos.x + w, pos.y);
    }
    if (this.walls[1]) {
      line(pos.x + w, pos.y, pos.x + w, pos.y + w);
    }
    if (this.walls[2]) {
      line(pos.x + w, pos.y + w, pos.x, pos.y + w);
    }
    if (this.walls[3]) {
      line(pos.x, pos.y + w, pos.x, pos.y);
    }
    //if (visited) {
    //  noStroke();
    //  rect(pos.x, pos.y, w, w);
    //}
  }

  void deleteWall(int index) {
    this.walls[index] = false;
  }
}
