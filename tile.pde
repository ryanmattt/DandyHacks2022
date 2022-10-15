public class Tile{
    int x;
    int y;
    int z;
    building tileBuilding;
    tileTraits tileEffect;
    boolean checkAdjacent(building buildingType){
        //check if there is a building of type buildingType adjacent to this tile
        currTile = this;
        for(int i =0; i<tileArray.length(); i++)
            if(currTile.checkDistance(this)==1 && currTile.getTileBuilding()==buildingType)
                return true;
        return false;

    }

    int checkDistance (Tile tile) {  //check the distance between this tile and tile
        return sqrt((this.getX()-tile.getX())^2+(this.getY()-tile.getY())^2+(this.getZ()-tile.getZ())^2);
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

    int getX(){ return x; }
    int getY(){ return y; }
    int getZ(){ return z; }

}