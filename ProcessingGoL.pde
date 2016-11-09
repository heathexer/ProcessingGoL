Cell[][] cells;
int square;
void setup() {
  size(800, 800);
  square = 10;
  cells = new Cell[square][square];
  for(int i = 0; i < square; i++) {
    for(int j = 0; j < square; j++) {
      cells[i][j] = new Cell(i, j);
    }
  }
}
void draw() {
  for(int i = 0; i < square; i++) {
    for(int j = 0; j < square; j++) {
      //cells[i][j].update();
    }
  }
}

void mouseClicked() {
  cells[floor((mouseX/(float)width)*square)][floor((mouseY/(float)width)*square)].toggle();
}

class Cell {
  private int xPos, yPos;
  private boolean isAlive;
  Cell(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.isAlive = false;
  }
  public boolean getAlive() {
    return this.isAlive;
  }
  public int checkSurround() {
    int n = 0;
    if(checkCell(xPos, yPos-1)) n++;
    if(checkCell(xPos+1, yPos-1)) n++;
    if(checkCell(xPos+1, yPos)) n++;
    if(checkCell(xPos+1, yPos+1)) n++;
    if(checkCell(xPos, yPos+1)) n++;
    if(checkCell(xPos-1, yPos+1)) n++;
    if(checkCell(xPos-1, yPos)) n++;
    if(checkCell(xPos-1, yPos-1)) n++;
    return n;
  }
  public void update() {
    if(checkSurround() == 3) {
      this.isAlive = true;
    } else if(checkSurround() < 2 || checkSurround() > 3) {
      this.isAlive = false;
    }
  }
  public void toggle() {
    System.out.print(checkSurround());
    isAlive = !isAlive;
    System.out.println(xPos+" "+yPos+" "+isAlive);
  }
}

boolean checkCell(int x, int y) {
  try {
    if(cells[x][y].getAlive()) return true;
    else return false;
  } catch(ArrayIndexOutOfBoundsException e) {
    return false;
  }
}
