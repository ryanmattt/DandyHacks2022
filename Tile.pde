public class Tile{
    int q;
    int r;
    int s;
    float x;
    float y;
    building tileBuilding;
    tileTraits tileEffect;

    public Tile(int qIn, int rIn, int sIn, float xIn, float yIn, building tileBuilding, tileTraits tileEffect){
        this.q = qIn;
        this.r = rIn;
        this.s = sIn;
        this.x = xIn;
        this.y = yIn;
        this.tileBuilding = tileBuilding;
        this.tileEffect = tileEffect;
    }

    boolean checkAdjacent(building buildingType){
        //check if there is a building of type buildingType adjacent to this tile
        Tile currTile = this;
        for(int i =0; i<tileArray.length(); i++)
            if(currTile.checkDistance(this)==2 && currTile.getTileBuilding()==buildingType){
                return true;
            }
        else{
        return false;
        }

    }

    int checkDistance (Tile tile) {  //check the distance between this tile and tile
        return sqrt((this.getQ()-tile.getQ())^2+(this.getR()-tile.getR())^2+(this.getS()-tile.getS())^2);
    }

    building getTileBuilding(){
        return tileBuilding;
    }

    tileTraits getTileTraits(){
        return tileEffect;
    }

    void setTileBuilding(building inputType){
        tileBuilding = inputType;
    }

    void setTileTraits(tileTraits inputEffect){
        tileEffect = inputEffect;
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