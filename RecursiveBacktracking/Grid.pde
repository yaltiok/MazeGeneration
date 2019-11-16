class Grid {


  Cell[][] cells;
  int cols, rows;
  int cellSize;
  int cellCount;
  Cell current;
  Cell next;
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
    findNeighbors();
    current.visited = true;
    current.highlight();
    show();
    if (next != null && !next.visited) {
      stack.add(getCurrent());
      removeWallBetween(getCurrent(), next);
      setCurrent(next);
    } else if (stack.size() > 0) {
      getCurrent().visited = true;
      setCurrent(stack.get(stack.size()-1));
      stack.remove(stack.size()-1);
    }
  }
  void fillGrid() {
    this.cells = new Cell[this.cols][this.rows];
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        cells[i][j] = new Cell(new PVector(i, j), cellSize);
      }
    }
    setCurrent(cells[0][0]);
  }

  void show() {
    for (int i = 0; i < this.cols; i++) {
      for (int j = 0; j < this.rows; j++) {
        cells[i][j].show();
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

  Cell pickNeighbor() {
    if (getCurrent().neighbors.size() > 0) {
      int i = floor(random(getCurrent().neighbors.size()));
      return getCurrent().neighbors.get(i);
    } else {
      return null;
    }
  }


  void findNeighbors() {
    this.next = null;
    int a = -1;
    int b = -1;
    float condition_1 = (cellSize * cols) - cellSize;
    float condition_2 = (cellSize * rows) - cellSize;
    Cell top = null;
    Cell right = null;
    Cell bottom = null;
    Cell left = null;
    for (int i = 0; i < cells.length; i++) {
      for (int j = 0; j < cells[0].length; j++) {
        if (getCurrent() == cells[i][j]) {
          a = i;
          b = j;
        }
      }
    }

    if (getCurrent().pos.y > cellSize/2) {
      top = this.cells[a][b - 1];
    }
    if (getCurrent().pos.x < condition_1) {
      right = this.cells[a + 1][b];
    }
    if (getCurrent().pos.y < condition_2) {
      bottom = this.cells[a][b + 1];
    }
    if (getCurrent().pos.x > cellSize/2) {
      left = this.cells[a - 1][b];
    }

    if (top != null && !top.visited) {
      getCurrent().addNeighbors(top);
    }
    if (right != null && !right.visited) {
      getCurrent().addNeighbors(right);
    }
    if (bottom != null && !bottom.visited) {
      getCurrent().addNeighbors(bottom);
    }
    if (left != null && !left.visited) {
      getCurrent().addNeighbors(left);
    }
    this.next = pickNeighbor();
  }
}
