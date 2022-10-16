class Tile{
    int q;
    int r;
    int s;
    float x;
    float y;
    Building tileBuilding;
    int terrainNum;

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

    boolean checkAdjacent(int buildingType){
        //check if there is a building of type buildingType adjacent to this tile
        Tile currTile = this;
        for(int i =0; i<everyTile.size(); i++)
            if(currTile.checkDistance(this)==2 && currTile.getBuilding().getBuildingType()==buildingType){
                return true;
            }
        return false;
    

    }
    boolean inHitbox(float xIn, float yIn){
        float r = hexRadius;
        double x0 = (double) x;
        double y0 = (double) y;
        double x1 = (double) x-r/2;
        double y1 = (double) y-r*sqrt(3)/2;
        double x2 = (double) x+r/2;
        double y2 = (double) y-r*sqrt(3)/2;
        double x3 = (double) x-r;
        double y3 = (double) y;
        double x4 = (double) x+r;
        double y4 = (double) y;
        double x5 = (double) x+r/2;
        double y5 = (double) y+r*sqrt(3)/2;
        double x6 = (double) x-r/2;
        double y6 = (double) y+r*sqrt(3)/2;
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
        return sqrt(pow(this.getQ()-tile.getQ(),2)+pow(this.getR()-tile.getR(),2 )+pow(this.getS()-tile.getS(), 2));
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

    public int[]  getTerrainMultiplier(int terrainNum){
        
    //0: Motherball
    //1: Garden
    //2: Village
    //3: Factory

        if(terrainNum == 0) { //Ocean
            return new int[] {0, 0, 0, 0}; 
        }
        else if(terrainNum == 1) {  //Fields
            return new int[] {1, 2, 1, 1}; 
        }
        else if(terrainNum == 2) { //Forest
            return new int[] {2, 1, 2, 1}; 
        }
        else if(terrainNum == 3) { //Mountain
            return new int[] {1, 1, 1, 2}; 
        }
        else if(terrainNum == 4) {  //Plains
            return new int[] {1, 1, 1, 1}; 
        }
        return new int[0];
    } 

    public String getTerrainName(){
        if(terrainNum == 0) 
        { return "Ocean"; }
        else if(terrainNum==1) 
        { return "Fields"; }
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
    public String getName(){
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
    
    String getName(int buildingType){
        return name;
    }

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

}