class Grid {


  Cell[][] cells;
  //Cell[][] gridToDisplay;
  int cols, rows;
  int cellSize;
  int cellCount;
  int count = 0;
  int step = 50;
  Cell current;
  Cell next;
  boolean finished = false;
  ArrayList<Cell> stack = new ArrayList();


  Grid(Cell[][] cells, int cellSize, int cols, int rows) {
    this.cells = cells;
    this.cellSize = cellSize;
    this.cols = cols;
    this.rows = rows;
    this.cellCount = cols*rows;
    fillGrid();
  }

  void update() {
    count++;
    getCurrent().clearNeighbors();
    this.next = pickNeighbor(getCurrent());
    current.visited = true;
    current.highlight();
    show();
    //if (count % step == 0) {
    //  println(count + " " + step);
    //  this.gridToDisplay = updateDisplayGrid();
    //}
    if (next != null) {
      stack.add(getCurrent());
      removeWallBetween(getCurrent(), next);
      setCurrent(next);
    } else if (stack.size() > 0) {
      getCurrent().visited = true;
      setCurrent(stack.get(stack.size()-1));
      stack.remove(stack.size()-1);
    }
    finished = isFinished();
  }

  void fillGrid() {
    this.cells = new Cell[this.cols][this.rows];
    //this.gridToDisplay = new Cell[this.cols][this.rows];
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        cells[i][j] = new Cell(new PVector(i, j), cellSize);
      }
    }
    setCurrent(cells[0][0]);
    stack.add(getCurrent());
    //this.gridToDisplay = updateDisplayGrid();
  }

  void show() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        if (cells[i][j].visited) {
          cells[i][j].show();
        }
      }
    }
  }

  void removeWallBetween(Cell a, Cell b) {
    if (a.pos.y - b.pos.y > 0) {
      a.deleteWall(0);
      b.deleteWall(2);
    } else if (a.pos.y - b.pos.y < 0) {
      a.deleteWall(2);
      b.deleteWall(0);
    }
    if (a.pos.x - b.pos.x > 0) {
      a.deleteWall(3);
      b.deleteWall(1);
    } else if (a.pos.x - b.pos.x < 0) {
      a.deleteWall(1);
      b.deleteWall(3);
    }
  }

  Cell getCurrent() {
    return current;
  }
  void setCurrent(Cell current) {
    this.current = current;
  }

  Cell pickNeighbor(Cell current) {
    findNeighbors(current);
    if (current.neighbors.size() > 0) {
      int i = floor(random(getCurrent().neighbors.size()));
      return getCurrent().neighbors.get(i);
    } else {
      return null;
    }
  }

  //Cell[][] updateDisplayGrid() {
  //  this.gridToDisplay = new Cell[cols][rows];
  //  for (int i = 0; i < this.cols; i++) {
  //    for (int j = 0; j < this.rows; j++) {
  //      this.gridToDisplay[i][j] = cells[i][j];
  //    }
  //  }
  //  return gridToDisplay;
  //}


  boolean isFinished() {
    return stack.size() == 0;
  }


  void findNeighbors(Cell current) {
    int a = -1;
    int b = -1;
    float condition_1 = (cellSize * cols) - cellSize;
    float condition_2 = (cellSize * rows) - cellSize;
    Cell top = null;
    Cell right = null;
    Cell bottom = null;
    Cell left = null;

    a = floor(current.pos.x / cellSize);
    b = floor(current.pos.y / cellSize);

    if (current.pos.y > cellSize/2) {
      top = this.cells[a][b - 1];
    }
    if (current.pos.x < condition_1) {
      right = this.cells[a + 1][b];
    }
    if (current.pos.y < condition_2) {
      bottom = this.cells[a][b + 1];
    }
    if (current.pos.x > cellSize/2) {
      left = this.cells[a - 1][b];
    }

    if (top != null && !top.visited) {
      current.addNeighbors(top);
    }
    if (right != null && !right.visited) {
      current.addNeighbors(right);
    }
    if (bottom != null && !bottom.visited) {
      current.addNeighbors(bottom);
    }
    if (left != null && !left.visited) {
      current.addNeighbors(left);
    }
  }
}
