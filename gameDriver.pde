
public Boolean lost = false;
public ArrayList<Tile> everyTile = new ArrayList<Tile>();
public float hexRadius,hexWidth;
public int hexScreenShift;
public boolean runDrawBackAndTiles= false;
public boolean hasRan = false;

public int food =9999;
public int dand = 0;
public int seeds =9999;
public int turnNum = 0;
public int numberOfTurns = 25;
Tile currentHover = null;
Building currentHoverBuilding = null;
public int currentHoverBuildingIndex = -1;
PImage gameBackground;


/*     seedCost = seedCostIn; //1
        foodCost = foodCostIn; //2
        seedUpkeep = seedUpkeepIn; //3
        foodUpkeep = foodUpkeepIn; //4
        seedProd = seedProdIn; //5
        foodProd = foodProdIn; //6
        dandProd = dandProdIn; //7
        buildingType = buildingTypeIn; //8 */
Building baseMother = new Building(-40, -30, 0, 15, 15, 0, 0, 0);
Building baseGarden = new Building(15, 0, 0, 0, 0, 10, 0, 1);
Building baseVillage = new Building(30, 20, 0, 15, 10, 0, 0, 2);
Building baseFactory = new Building(10, 30, 10, 0, 0, 0, 500, 3);
 
public void startGame() {
if (!hasRan) {
  clear();
  background(41,	31,	102);
  gameBackground=spring;
 setVariables();
  everyTile = generateTiles(3);
  hasRan = true;
  drawTiles();
   drawBackAndTiles();
}
drawNextTurnButton();
if(currentBuilding != null || runDrawBackAndTiles) drawBackAndTiles();
checkCurrTile();
updateBuilding();
drawInfoPanel();
drawBar();
updateInfo(currentHover);
if(currentHoverBuildingIndex!=-1) updateInfoB(buildingsOnPanel[currentHoverBuildingIndex]);
updateBoard();
followMouse();
}

void drawBackAndTiles()
{
  // image(gameBackground, -2,-2, displayHeight*16/9,displayHeight);
  clear();
  background(41,	31,	102);
  drawTiles();
  runDrawBackAndTiles = false;
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



void polygon(float x, float y, float radius, int npoints, PImage img, PImage buildingImage) {
  float angle = TWO_PI / npoints;
  if(img!= null){
  img.resize((int)(2*radius), (int)(radius * 0.8660254*2));
  image(img, x - radius, y - sin(PI/3) * radius);
  }
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
  for (int i = 0; i < everyTile.size(); i++) 
    setTerrainTextureAndLocation(everyTile.get(i));
}

void updateBoard()
{
    for (int i = 0; i < everyTile.size(); i++) 
    {
      Tile currentTile = everyTile.get(i);
      float coord1 = (float) (currentTile.getX1()+currentTile.getX2())/2;
      float coord2 = (float) (currentTile.getY1()+currentTile.getY2())/2;
    if(currentTile.getBuilding()!=null)
    {
        image(currentTile.getBuilding().getBuildingImage(), currentTile.getX()-hexWidth*.9, currentTile.getY()-hexWidth*.9, 1.8*hexWidth, 1.8*hexWidth);
    }
    }


}

void checkCurrTile()
{ 
  for (int i = 0; i < everyTile.size(); i++) 
  {
          Tile currentTile = everyTile.get(i);

  if(currentTile.inHitbox(mouseX,mouseY))
    {
      
      currentHover=everyTile.get(i);
      break;
    }
    else currentHover=null;
  }
}


void setTerrainTextureAndLocation(Tile t)
{
  float tileX = t.getX();
  float tileY = t.getY();
  if(t.getTerrain() == 0){
    polygon(tileX,tileY, hexRadius, 6, waterTexture, t.getImg());
    }
    else if(t.getTerrain() == 1){
    polygon(tileX,tileY, hexRadius, 6, lushTexture, t.getImg());
    }
    else if(t.getTerrain() == 3){
    polygon(tileX,tileY, hexRadius, 6, mountainTexture, t.getImg());
    }
    else if(t.getTerrain() == 2){
    polygon(tileX,tileY, hexRadius, 6, forestTexture, t.getImg());
    }
    else if(t.getTerrain() == 4){
    polygon(tileX,tileY, hexRadius, 6, plainsTexture, t.getImg());
    }
}


public void drawNextTurnButton() {
  float pointX = buttonWidth*2/9;
  float pointY = displayHeight-displayHeight*3/20;

  if(checkButtons(pointX, pointY, buttonWidth, buttonHeight))
    image(nextTurnTint, pointX, pointY, buttonWidth, buttonHeight);
  else
    image(nextTurn, pointX, pointY, buttonWidth, buttonHeight);
}

 boolean placeBuilding(Building b, Tile t)
{
  if(t.getBuilding() != null)
  {
    println("building  is null");
    currentBuilding = null;
    return false;
  }
  else if(b.getFoodCost() > food && b.getSeedCost() > seeds)
  {
        println("not enough resources");
    currentBuilding = null;
    return false;

  }
  else if(t.getTerrain()==0)
  {
    println("can't build on water");
    currentBuilding = null;
    return false;
  }
  else if((b.getBuildingType()!=2) && (!t.checkAdjacent(2) && !t.checkAdjacent(0)))
  {
    println("is a village and isn't adjacent to a village");
    currentBuilding = null;
    return false;
  }
  else
  {
    t.setBuilding(b.buildCopy());
    food -= b.getFoodCost();
    seeds -= b.getSeedCost();
    currentBuilding = null;
    polygon(t.getX(),t.getY(),hexRadius,6,null,b.getBuildingImage());
    return true;
  }

}
void nextTurn(){
    calculateTotals();
    calculateWinLose();
    turnNum++;
    setSeasonBackground();

}

void calculateTotals()
{
  for (int i = 0; i < everyTile.size(); i++)
  {
    Tile tile = everyTile.get(i);
   if(tile.getBuilding()!=null)
   {
    Building building = tile.getBuilding();
    int buildingNum = tile.getBuilding().getBuildingType();
    if(buildingNum != -1)
    {
      food += building.getFoodProd() * tile.getTerrainMultiplier()[buildingNum];
      seeds += building.getSeedProd() * tile.getTerrainMultiplier()[buildingNum];
      dand += building.getDandProd() * tile.getTerrainMultiplier()[buildingNum]; 
      food -= building.getFoodUpkeep();
      seeds -= building.getSeedUpkeep();

    }
  }
}
}

void followMouse(){
  if(currentBuilding != null){
    PImage img = currentBuilding.getBuildingImage();
    image(img, mouseX-displayHeight/20, mouseY-displayHeight/20, displayHeight/10, displayHeight/10);
  }
}

void calculateWinLose(){
  if(turnNum == numberOfTurns){
    if(food < 0 || seeds < 0) lost = true;
      gameScreen = 3;
  }
}

void setSeasonBackground()
{
  if(turnNum%4 == 0) gameBackground = winter;
  else if(turnNum%4 == 1) gameBackground = spring;
  else if(turnNum%4 == 2) gameBackground = summer;
  else if(turnNum%4 == 3) gameBackground = fall;
}