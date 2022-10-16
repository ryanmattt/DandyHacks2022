class Tile{
    int q;
    int r;
    int s;
    float x;
    float y;
    Building tileBuilding;
    int terrainNum;
    PImage img;
    double x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6;


    Tile(int qIn, int rIn, int sIn, int terrainIn){
        this.q = qIn;
        this.r = rIn;
        this.s = sIn;
        terrainNum=terrainIn;
        tileBuilding = null;
    }

    Tile(int qIn, int rIn, int sIn, float xIn, float yIn, Building tileBuildingIn, int terrainNumIn){
        this.q = qIn;
        this.r = rIn;
        this.s = sIn;
        this.x = xIn;
        this.y = yIn;
        this.tileBuilding = tileBuildingIn;
        this.terrainNum = terrainNumIn;
    }
    
    PImage getImg(){
        return img;
    }

    boolean checkAdjacent(int buildingType){
        //check if there is a building of type buildingType adjacent to this tile
        Tile currTile = this;
                println();
        for(int i = 0; i<everyTile.size(); i++)
        { if(everyTile.get(i).tileBuilding!=null)
        {
            currTile=everyTile.get(i);
            println("checking tile: " + i + " buildingType: " + currTile.getBuilding().getBuildingType()+ " distance from origin:" + checkDistance(currTile));
            if(checkDistance(currTile)== 1.0 && currTile.getBuilding().getBuildingType()==buildingType){
                println("found adjacent building");
                return true;
            }
        }
        }
        println();
        return false;
    

    }
    boolean inHitbox(float xIn, float yIn){
        float r = hexRadius;
        double x0 = (double) x;
        double y0 = (double) y;
        x1 = (double) x-r/2;
        y1 = (double) y-r*sqrt(3)/2;
        x2 = (double) x+r/2;
        y2 = (double) y-r*sqrt(3)/2;
        x3 = (double) x-r;
        y3 = (double) y;
        x4 = (double) x+r;
        y4 = (double) y;
        x5 = (double) x+r/2;
        y5 = (double) y+r*sqrt(3)/2;
        x6 = (double) x-r/2;
        y6 = (double) y+r*sqrt(3)/2;
        fill(0,255,255);
        
        if(isInsideTriangle(x1, y1, x2, y2, x0, y0, xIn, yIn)){
            // triangle((float) x1, (float) y1, (float) x2, (float) y2, (float) x0, (float) y0);
            return true;
        }
        else if(isInsideTriangle(x3, y3, x1, y1, x0, y0, xIn, yIn)){
            // triangle((float) x3, (float) y3, (float) x1, (float) y1, (float) x0, (float) y0);
            return true;
        }
        else if(isInsideTriangle(x6, y6, x3, y3, x0, y0, xIn, yIn)){
            // triangle((float) x3, (float) y3, (float) x6, (float) y6, (float) x0, (float) y0);
            return true;
        }
        else if(isInsideTriangle(x5, y5, x6, y6, x0, y0, xIn, yIn)){
            // triangle((float) x5, (float) y5, (float) x6, (float) y6, (float) x0, (float) y0);
            return true;
        }
        else if(isInsideTriangle(x4, y4, x5, y5, x0, y0, xIn, yIn)){
            // triangle((float) x4, (float) y4, (float) x5, (float) y5, (float) x0, (float) y0);
            return true;
        }
      
        else if(isInsideTriangle(x2, y2, x4, y4, x0, y0, xIn, yIn)){
            // triangle((float) x2, (float) y2, (float) x4, (float) y4, (float) x0, (float) y0);
            return true;
        }
        return false;
       
    }

boolean isInsideTriangle(double aX, double aY, 
  double bX, double bY, 
  double cX, double cY, 
  double pX, double pY) {
  double ax, ay, bx, by, cx, cy, apx, apy, bpx, bpy, cpx, cpy;
  double cCROSSap, bCROSScp, aCROSSbp;

  ax = cX - bX;  
  ay = cY - bY;
  bx = aX - cX;  
  by = aY - cY;
  cx = bX - aX;  
  cy = bY - aY;
  apx= pX - aX;  
  apy= pY - aY;
  bpx= pX - bX;  
  bpy= pY - bY;
  cpx= pX - cX;  
  cpy= pY - cY;

  aCROSSbp = ax*bpy - ay*bpx;
  cCROSSap = cx*apy - cy*apx;
  bCROSScp = bx*cpy - by*cpx;

  return ((aCROSSbp >= 0.0f) && (bCROSScp >= 0.0f) && (cCROSSap >= 0.0f));
}

    float checkDistance (Tile tile) {  //check the distance between this tile and tile
        return (abs(this.getQ()-tile.getQ())+abs(this.getR()-tile.getR())+abs(this.getS()-tile.getS()))/2;
    }
    Building getBuilding(){
        return tileBuilding;
    }
    void setTerrain(int inTerrain){
        this.terrainNum = inTerrain;
    }

    void setBuilding(Building inputType){
        tileBuilding = inputType;
    }

    int getTerrain()
    {
        return this.terrainNum;
    }

    public int[]  getTerrainMultiplier(){
        
    //0: Motherball
    //1: Garden
    //2: Village
    //3: Factory

        if(this.terrainNum == 0) { //Ocean
            return new int[] {0, 0, 0, 0}; 
        }
        else if(this.terrainNum == 1) {  //Fields
            return new int[] {1, 2, 1, 1}; 
        }
        else if(this.terrainNum == 2) { //Forest
            return new int[] {2, 1, 2, 1}; 
        }
        else if(this.terrainNum == 3) { //Mountain
            return new int[] {1, 1, 1, 2}; 
        }
        else if(this.terrainNum == 4) {  //Plains
            return new int[] {1, 1, 1, 1}; 
        }
        return new int[0];
    } 

    public String getTerrainName(){
        if(terrainNum == 0) 
        { return "Ocean"; }
        else if(terrainNum==1) 
        { return "Lush Fields"; }
        else if(terrainNum==2) 
        { return "Forest"; }
        else if(terrainNum==3) 
        { return "Mountain"; }
        else if(terrainNum==4) 
        { return "Plains"; }
        return "Plains";
    }
    
    float getX(){ return x; }
    float getY(){ return y; }
    int getQ(){ return q; }
    int getR(){ return r; }
    int getS(){ return s; }
    void setX(float xIn){ x = xIn; }
    void setY(float yIn){ y = yIn; }
    void setXY(float xIn, float yIn){ x = xIn; y = yIn; }
    double getX1(){ return x1; }
    double getY1(){ return y1; }
    double getX2(){ return x2; }
    double getY2(){ return y2; }


}

public class Building {
    String name;
    int seedCost;
    int foodCost;
    int seedUpkeep;
    int foodUpkeep;
    int seedProd;
    int foodProd;
    int dandProd;
    int buildingType;
    public String getBuildingName(){
        return name;
    };

    int getSeedCost(){ return seedCost; }
    int getFoodCost(){ return foodCost; }
    int getSeedUpkeep(){ return seedUpkeep; }
    int getFoodUpkeep(){ return foodUpkeep; }
    int getSeedProd(){ return seedProd; }
    int getFoodProd(){ return foodProd; }
    int getDandProd(){ return dandProd; }
    int getBuildingType(){ return buildingType; }
    

    Building(int seedCostIn, int foodCostIn, int seedUpkeepIn, int foodUpkeepIn, int seedProdIn, int foodProdIn, int dandProdIn, int buildingTypeIn){
        seedCost = seedCostIn;
        foodCost = foodCostIn;
        seedUpkeep = seedUpkeepIn;
        foodUpkeep = foodUpkeepIn;
        seedProd = seedProdIn;
        foodProd = foodProdIn;
        dandProd = dandProdIn;
        buildingType = buildingTypeIn;

        if(buildingType == 0) { name = "Motherball"; }
        else if(buildingType == 1) { name = "Garden"; }
        else if(buildingType == 2) { name = "Village"; }
        else if(buildingType == 3) { name = "Dandie Factory"; }
    }
    

    Building buildCopy ()
    {
        return new Building(seedCost, foodCost, seedUpkeep, foodUpkeep, seedProd, foodProd, dandProd, buildingType);
    }

    PImage getBuildingImage(){
        if(buildingType == 0) { return motherball; }
        else if(buildingType == 1) { return garden; }
        else if(buildingType == 2) { return village; }
        else if(buildingType == 3) { return factory; }
        return null;
    }

}