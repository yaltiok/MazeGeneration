int cols, rows;
Grid grid;
Cell current;
Cell[][] cells;
int cellSize = 10;
int a = 0;
boolean start = false;

void setup() {
  size(601, 601);

  cols = floor(width / cellSize);
  rows = floor(height / cellSize);
  grid = new Grid(cells, cellSize, cols, rows);
}

void draw() {
  background(51);
  //frameRate(10);
  push();
  fill(255);
  textSize(50);
  strokeWeight(4);
  text(floor(frameRate), width/2 - 40, height/2);
  pop();

  if (start) {
    current = grid.getCurrent();
    grid.update();
  }
  if (grid.finished) {
    noLoop();
  }
}


void mousePressed() {
  start = !start;
}
