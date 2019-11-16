int cols, rows;
Grid grid;
Cell current;
Cell[][] cells;
int cellSize = 10;
int a = 0;

void setup() {
  size(601, 601);

  cols = floor(width / cellSize);
  rows = floor(height / cellSize);
  grid = new Grid(cells, cellSize, cols, rows);
}

void draw() {
  background(51);
  frameRate(10);
  current = grid.getCurrent();
  grid.update();
}
