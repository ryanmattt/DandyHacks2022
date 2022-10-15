
public ArrayList<Tile> everyTile = new ArrayList<Tile>();
public float hexRadius,hexWidth;
public int hexScreenShift;

public boolean hasRan = false;



public void startGame() {
  background(41,	31,	102);
if (!hasRan)
{
 setVariables();
  everyTile = generateTiles(3);
  hasRan = true;
}
drawTiles();
}

public void setVariables()
{
  hexRadius = (displayHeight-displayHeight/10)/(7*sqrt(3));
  hexWidth = sqrt(2) / 2 * hexRadius;
  hexScreenShift = (int) displayHeight/70;
}

ArrayList<Tile> generateTiles(int map_radius) {
    ArrayList<Tile> tempTileList = new ArrayList<Tile>();
    for (int q = -map_radius; q <= map_radius; q++) { //magic code 
      int r1 = max(-map_radius, -q - map_radius);
      int r2 = min(map_radius, -q + map_radius);
      for (int r = r1; r <= r2; r++) {
          tempTileList.add(new Tile(q,r,-q-r,genTerrain()));
      }
    }
    tempTileList.get(0).setXY(displayWidth/2, displayHeight/2);
    int currQ;
    int currR;
    int currS;
    float sideA;
    float centerX = tempTileList.get(0).getX();
    float centerY = tempTileList.get(0).getY();
    for (int i = 0; i < tempTileList.size(); i++) {
        currQ = tempTileList.get(i).getQ();
        currR = tempTileList.get(i).getR();
        currS = tempTileList.get(i).getS();
        sideA = sqrt(pow(hexRadius,2)-pow(hexRadius/2,2));
        if(currQ<=0)
        tempTileList.get(i).setXY(centerX + (-hexWidth*currS) + (hexWidth*currQ) + (-hexWidth*currR), centerY+(sideA*currS)+(-sideA*currR));
        else if(currQ>0)
        tempTileList.get(i).setXY(centerX + (-hexWidth*currS) + (hexWidth*currQ)+currQ*10 + (-hexWidth*currR), centerY+(sideA*currS)+(-sideA*currR));
    }

    return tempTileList;
    }

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
    // System.out.println("x:"+ x + " y:" + y + " radius:" + radius + " npoints:" + npoints);
  beginShape();
  fill(255,0,0);
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy + hexScreenShift);
  }
  endShape(CLOSE);

}
void drawTiles()
{
  // println("Length"+everyTile.size());
  for (int i = 0; i < everyTile.size(); i++) {
    polygon(everyTile.get(i).getX(), everyTile.get(i).getY(), hexRadius, 6);

  }
}

int genTerrain()
{
  int rand = (int)random(0,100);
  if(rand>0 && rand<=15){
    return 0;
  }
  if(rand>15 && rand<=25){
    return 1;
  }
  if(rand>25 && rand<=35){
    return 2;
  }
  if(rand>35 && rand<=55){
    return 3;
  }
  if(rand>55 && rand<=100){
    return 4;
  }
  else{
    return 4;
  }
}