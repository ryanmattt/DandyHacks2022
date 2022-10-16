ArrayList<Tile> generateTiles(int map_radius) {
    ArrayList<Tile> tempTileList = new ArrayList<Tile>();
    for (int q = -map_radius; q <= map_radius; q++) { //magic code 
      int r1 = max(-map_radius, -q - map_radius);
      int r2 = min(map_radius, -q + map_radius);
      for (int r = r1; r <= r2; r++) {
          tempTileList.add(new Tile(q,r,-q-r,genTerrain()));
      }
    }
    tempTileList.get(18).setTerrain(4);
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
        tempTileList.get(i).setXY(centerX + (-hexWidth*currS) + (hexWidth*currQ) + (-hexWidth*currR) + currQ*10, centerY+(sideA*currS)+(-sideA*currR)+ hexScreenShift);
        else if(currQ>0)
        tempTileList.get(i).setXY(centerX + (-hexWidth*currS) + (hexWidth*currQ)+currQ*10 + (-hexWidth*currR), centerY+(sideA*currS)+(-sideA*currR)+ hexScreenShift);
    }

    return tempTileList;
    }


int genTerrain()
{
  int rand = (int) random(0,100);
  if(rand>0 && rand<=19){
    return 0;
  }
  if(rand>19 && rand<=31){
    return 1;
  }
  if(rand>31 && rand<=43){
    return 2;
  }
  if(rand>43 && rand<=55){
    return 3;
  }
  if(rand>55 && rand<=100){
    return 4;
  }
  else{
    return 4;
  }
}