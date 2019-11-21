int cols, rows;
Grid grid;
Cell current;
Cell[][] cells;
int cellSize = 50;
int a = 0;
boolean start = false;
int left;

void setup() {
  //size(301, 301);
  fullScreen();
  frameRate(1000);
  cols = floor(width / cellSize);
  rows = floor(height / cellSize);
  grid = new Grid(cells, cellSize, cols, rows);
  left = cols*rows*2-2;
}

void draw() {
  background(133,0,200,100);

  push();
  fill(255);
  textSize(50);
  strokeWeight(4);
  text(left, width/2 - 40, height/2);
  pop();

  if (start) {
    current = grid.getCurrent();
    grid.update();
    left--;
  }
  if (grid.finished) {
    grid.show();
    noLoop();
  }
}


void mousePressed() {
  start = !start;
}
