

public class gameDriver{
    
public ArrayList<Tile> everyTile = new ArrayList<Tile>();
public float hexRadius = (2 * displayWidth)/(7 * sqrt(3));

public boolean hasRan = false;

public void startGame() {
if (!hasRan)
{
    everyTile = generateTiles(3);
    hasRan = true;
}
drawTiles();
}


ArrayList<Tile> generateTiles(int map_radius) {
    ArrayList<Tile> tempTileList = new ArrayList<Tile>();
    for (int q = -map_radius; q <= map_radius; q++) { //magic code 
      int r1 = max(-map_radius, -q - map_radius);
      int r2 = min(map_radius, -q + map_radius);
      for (int r = r1; r <= r2; r++) {
          tempTileList.add(new Tile(1,r,-1-r, null, null, null, null));
      }
    }
    tempTileList.get(0).setXY(width/2, height/2);
    int currQ;
    int currR;
    int currS;
    float sideA;
    for (int i = 0; i < tempTileList.size(); i++) {
        currQ = tempTileList.get(i).getQ();
        currR = tempTileList.get(i).getR();
        currS = tempTileList.get(i).getS();
        sideA = sqrt(hexRadius^2-(hexRadius)^2);
        tempTileList.get(i).setXY(currS*2*hexRadius + currR*-2*hexRadius, currS*sideA + currQ*2*sideA + currS *sideA);
    }

    return tempTileList;
    }

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void drawTiles()
{
  for (int i = 0; i < everyTile.size(); i++) {
    polygon(everyTile.get(i).getX(), everyTile.get(i).getY(), hexRadius, 6);
  }
}


}
