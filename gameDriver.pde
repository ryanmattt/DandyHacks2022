
public Boolean lost = false;
public ArrayList<Tile> everyTile = new ArrayList<Tile>();
public float hexRadius,hexWidth;
public int hexScreenShift;

public boolean hasRan = false;

public int food =20;
public int dand = 0;
public int seeds =20;
public int turnNum = 0;
Tile currentHover = null;
Building currentHoverBuilding = null;
public int currentHoverBuildingIndex = -1;

/*     seedCost = seedCostIn; //1
        foodCost = foodCostIn; //2
        seedUpkeep = seedUpkeepIn; //3
        foodUpkeep = foodUpkeepIn; //4
        seedProd = seedProdIn; //5
        foodProd = foodProdIn; //6
        dandProd = dandProdIn; //7
        buildingType = buildingTypeIn; //8 */
Building baseMother = new Building(-40, -30, 0, 15, 10, 0, 0, 0);
Building baseGarden = new Building(15, 0, 0, 0, 0, 10, 0, 1);
Building baseVillage = new Building(30, 20, 0, 10, 10, 0, 0, 2);
Building baseFactory = new Building(10, 30, 10, 0, 0, 0, 500, 3);
 
public void startGame() {
  background(41,	31,	102);
if (!hasRan)
{
 setVariables();
  everyTile = generateTiles(3);
  hasRan = true;
}
updateBuilding();
drawInfoPanel();
drawBar();
drawTiles();
updateInfo(currentHover);
if(currentHoverBuildingIndex!=-1) updateInfoB(buildingsOnPanel[currentHoverBuildingIndex]);
drawTaskbar();
}


int inWhichBuilding()
{
  for (int i = 0; i < buildingsOnPanel.length; i++)
    if (buildingsOnPanel[i]!=null && buildingsOnPanel[i].mouseInSquare())
      return i;
  return -1;
}

void updateBuilding()
{
  currentHoverBuildingIndex = inWhichBuilding();
  if (currentHoverBuildingIndex != -1)
  {
    currentHoverBuilding = buildingsOnPanel[currentHoverBuildingIndex].getBuilding();
  }
  else
  {
    currentHoverBuilding = null;
  }
}

public void setVariables()
{
  hexRadius = (displayHeight-displayHeight/10)/(7*sqrt(3));
  hexWidth = sqrt(2) / 2 * hexRadius;
  hexScreenShift = (int) displayHeight/70;
}


public void drawTaskbar()
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
void polygon(float x, float y, float radius, int npoints, PImage img) {
  float angle = TWO_PI / npoints;
  img.resize((int)(2*radius), (int)(radius * 0.8660254*2));
  image(img, x - radius, y - sin(PI/3) *radius);
    // System.out.println("x:"+ x + " y:" + y + " radius:" + radius + " npoints:" + npoints);
  beginShape();
  fill(255,0,0,0);
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);

}
void drawTiles()
{
  currentHover=null;
  // println("Length"+everyTile.size());
      
      float tileX = 0;
      float tileY = 0;
      textSize(40);
  for (int i = 0; i < everyTile.size(); i++) {
    
    setTerrainTextureAndLocation(everyTile.get(i));
    if(everyTile.get(i).inHitbox(mouseX,mouseY))
    {
      currentHover=everyTile.get(i);
    fill(255,0,255); }
    else
    fill(255,255,255);
    text(everyTile.get(i).getTerrainName(), tileX-80, tileY-20, tileX+200, tileY+40);
    }
  
}

void setTerrainTextureAndLocation(Tile t)
{
  float tileX = t.getX();
  float tileY = t.getY();
  if(t.getTerrainName() == "Ocean"){
    polygon(tileX,tileY, hexRadius, 6, waterTexture);
    }
    else if(t.getTerrainName() == "Fields"){
    polygon(tileX,tileY, hexRadius, 6, lushTexture);
    }
    else if(t.getTerrainName() == "Mountain"){
    polygon(tileX,tileY, hexRadius, 6, mountainTexture);
    }
    else if(t.getTerrainName() == "Forest"){
    polygon(tileX,tileY, hexRadius, 6, forestTexture);
    }
    else if(t.getTerrainName() == "Plains"){
    polygon(tileX,tileY, hexRadius, 6, plainsTexture);
    }
}

/*

void drawNextTurn() {
  
}

*/

 boolean placeBuilding(Building b, Tile t)
{
  if(t.getBuilding() != null)
  {
    currentBuilding = null;
    return false;
  }
  else if(b.getFoodCost() > food || b.getSeedCost() > seeds)
  {
    
    currentBuilding = null;
    return false;

  }
  else if(b.getBuildingType()!=2 && !t.checkAdjacent(2))
  {
    currentBuilding = null;
    return false;
    
  }
  else
  {
    t.setBuilding(b);
    food -= b.getFoodCost();
    seeds -= b.getSeedCost();
    currentBuilding = null;
    return true;
  }

}
/*void nextTurn(){
    calculateTotals();
    calculateWinLose();
    turnNum++;

}
/*
void calculateTotals()
{
  for (int i = 0; i < everyTile.length; i++)
  {
    if(everyTile.getBuildingType(i) != null)
    {

      food += everyTile.getFoodProd(i);
      seeds += everyTile.getSeedProd(i);
      dand += everyTile.getDandProd(i);
      food -= everyTile.getFoodUpkeep(i);
      seeds -= everyTile.getSgetDandProdeedUpkeep(i));
      dand -= everyTile.getDandUpkeep(i);

    }
  }
}
*/
/*void followMouse(){
  if(currentBuilding != null){
    img = currentBuilding.getImg();
    image(img, mouseX, mouseY, displayHeight/10, displayHeight/10);
  }
}
}  
*/
/*void calculateWinLose(){
if(turnNum == 24){
  if(food < 0 || seeds < 0 || dand < 0){
    lost = true;
  }
  else if(food >= 100 && seeds >= 100 && dand >= 100){
    win = true;
  }
  }
}
*/




