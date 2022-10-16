
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
Tile currentHover = null;
Building currentHoverBuilding = null;
public int currentHoverBuildingIndex = -1;
float nextTurnWidth=0;
float nextTurnHeight=0;
float continueButtonWidth = 0;
float continueButtonHeight = 0;



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
  
if (!hasRan) {
 setVariables();
  everyTile = generateTiles(3);
  hasRan = true;
  background(41,	31,	102);
  drawTiles();
}
if(currentBuilding != null || runDrawBackAndTiles)
drawBackAndTiles();

updateCurrentTile();
updateBuilding();
drawInfoPanel();
drawBar();
updateInfo(currentHover);
if(currentHoverBuildingIndex!=-1) updateInfoB(buildingsOnPanel[currentHoverBuildingIndex]);
followMouse();
}

void drawBackAndTiles()
{
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

void updateCurrentTile()
{
    for (int i = 0; i < everyTile.size(); i++) 
    {
      Tile currentTile = everyTile.get(i);
      float coord1 = (float) (currentTile.getX1()+currentTile.getX2())/2;
      float coord2 = (float) (currentTile.getY1()+currentTile.getY2())/2;
    if(currentTile.getBuilding()!=null)
    {
        image(currentTile.getBuilding().getBuildingImage(), currentTile.getX(), currentTile.getY(), 2*hexWidth, 2*hexWidth);
    }
    
    if(currentTile.inHitbox(mouseX,mouseY))
      currentHover=everyTile.get(i);
     
    }
}

void setTerrainTextureAndLocation(Tile t)
{
  float tileX = t.getX();
  float tileY = t.getY();
  if(t.getTerrainName() == "Ocean"){
    polygon(tileX,tileY, hexRadius, 6, waterTexture, t.getImg());
    }
    else if(t.getTerrainName() == "Fields"){
    polygon(tileX,tileY, hexRadius, 6, lushTexture, t.getImg());
    }
    else if(t.getTerrainName() == "Mountain"){
    polygon(tileX,tileY, hexRadius, 6, mountainTexture, t.getImg());
    }
    else if(t.getTerrainName() == "Forest"){
    polygon(tileX,tileY, hexRadius, 6, forestTexture, t.getImg());
    }
    else if(t.getTerrainName() == "Plains"){
    polygon(tileX,tileY, hexRadius, 6, plainsTexture, t.getImg());
    }
}


public void drawNextTurn() {
   nextTurnWidth = displayWidth*1/10;
   nextTurnHeight = displayHeight*1/8;
   fill(255, 255, 0);
  rect(0, displayHeight/1.07, nextTurnWidth, nextTurnHeight, 20, 20, 0, 0);
  //text("Next Turn", nextturnWidth/2, displayHeight/1.06);
}


public void drawContinueButton() {
   continueButtonWidth = displayWidth*1/8;
   continueButtonHeight = displayHeight*1/6;
   fill(255, 0, 0);
   rect(displayWidth/2, displayHeight/1.07, nextTurnWidth, nextTurnHeight, 20, 20, 0, 0);
}


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
    polygon(t.getX(),t.getY(),hexRadius,6,null,b.getBuildingImage());
    return true;
  }

}
void nextTurn(){
    calculateTotals();
    calculateWinLose();
    turnNum++;

}

void calculateTotals()
{
  for (int i = 0; i < everyTile.size(); i++)
  {
    Tile tile = everyTile.get(i);

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

void followMouse(){
  if(currentBuilding != null){
    PImage img = currentBuilding.getBuildingImage();
    image(img, mouseX-displayHeight/20, mouseY-displayHeight/20, displayHeight/10, displayHeight/10);
  }
}

void calculateWinLose(){
if(turnNum == 24){
  if(food < 0 || seeds < 0 || dand < 0){
    lost = true;
    gameScreen = 3;
  }
  else {
    gameScreen = 3;
  }
  }
  }