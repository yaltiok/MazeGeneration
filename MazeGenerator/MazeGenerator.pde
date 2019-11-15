int cols, rows;
int cellSize = 20;
Cell[][] grid;
Cell current;
int a = 0;

void setup() {
  size(801, 601);

  cols = floor(width / cellSize);
  rows = floor(height / cellSize);
  grid = new Cell[cols][rows];
  fillGrid(grid);
  current = grid[0][0];
}

void draw() {
  background(51);
  frameRate(5);
  showGrid(grid);
}


void showGrid(Cell[][] grid) {
  for (int i = 0; i< cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show();
    }
  }
}
void fillGrid(Cell[][] grid) {
  for (int i = 0; i< cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(new PVector(i*cellSize, j*cellSize), cellSize);
    }
  }
}
