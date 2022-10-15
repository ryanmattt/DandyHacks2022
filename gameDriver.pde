

public ArrayList<Tile> everyTile = new ArrayList<Tile>();
public float hexRadius,hexWidth;
public int hexScreenShift;

public boolean hasRan = false;

public int food =20;
public int dand = 0;
public int seeds =20;

public void startGame() {
  background(41,	31,	102);
if (!hasRan)
{
 setVariables();
  everyTile = generateTiles(3);
  hasRan = true;
}
drawTiles();
drawSideboard();
}

public void setVariables()
{
  hexRadius = (displayHeight-displayHeight/10)/(7*sqrt(3));
  hexWidth = sqrt(2) / 2 * hexRadius;
  hexScreenShift = (int) displayHeight/70;
}


public void drawSideboard()
{
  fill(0,0,0);
  rect(0,0,displayWidth,displayHeight/18);
  fill(255,255,255);
  textSize(20);
  text("Food: " + food, 10, 20);
  text("Dand: " + dand, 10, 40);
  text("Seeds: " + seeds, 10, 60);
  text("Mouse position" + mouseX + " " + mouseY, 200, 20);
}
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
    // System.out.println("x:"+ x + " y:" + y + " radius:" + radius + " npoints:" + npoints);
  beginShape();
  fill(255,0,0);
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);

}
void drawTiles()
{
  // println("Length"+everyTile.size());
      
      float tileX = 0;
      float tileY = 0;
      textSize(40);
  for (int i = 0; i < everyTile.size(); i++) {
    tileX = everyTile.get(i).getX();
    tileY = everyTile.get(i).getY();
    polygon(tileX,tileY, hexRadius, 6);
    if(everyTile.get(i).inHitbox(mouseX,mouseY))
    {println(i);

    fill(255,0,255); }
    else
    fill(255,255,255);
    text(everyTile.get(i).getTerrainName(), tileX, tileY, tileX+200, tileY+40);

  }
}






 boolean placeBuilding(Building b, Tile t)
{
  if(t.getBuilding() != null)
  {
    return false;
  }
  else if(b.getFoodCost() > food || b.getSeedCost() > seeds)
  {
    return false;
  }
  else if(b.getBuildingType()!=2 && !t.checkAdjacent(2))
  {
    return false;
  }
  else
  {
    t.setBuilding(b);
    food -= b.getFoodCost();
    seeds -= b.getSeedCost();
    return true;
  }

}




