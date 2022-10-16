public float infoPanelHeight, infoPanelWidth, seasonPanelHeight, seasonPanelWidth;
public boolean infoRan = false;
public String currentTitle = "";
public int paragraphTextSize = 30;
public int titleTextSize = 50;
float textGap;
String currentSeasonArray[] = {};
void drawInfoPanel() {
if(!infoRan) infoPaneStart();
fill(panelColor);
rect(displayWidth-infoPanelWidth, displayHeight*1/9, infoPanelWidth, infoPanelHeight, 20,0,0,20);
rect(displayWidth-seasonPanelWidth, displayHeight*13/18, seasonPanelWidth, seasonPanelHeight, 20, 0, 0, 20);

fill(textColor);
textAlign(LEFT);
textSize(paragraphTextSize);
text("Food: " + food+  " ("+ String.valueOf(foodChange)+")" , displayWidth-textGap, displayHeight*57/72);
text("Seeds: " + seeds+" ("+ String.valueOf(seedChange)+")", displayWidth-textGap, displayHeight*59/72);
text("Dandies: " + dand + " ("+ String.valueOf(dandChange)+")", displayWidth-textGap, displayHeight*61/72);
text("Turn Number: " + turnNum +"/"+numberOfTurns, displayWidth-textGap, displayHeight*63/72);
getSeason();
text("Season: " + currentSeasonArray[0] + " " + currentSeasonArray[1], displayWidth-textGap, displayHeight*65/72);
text(currentSeasonArray[2] + " " + currentSeasonArray[3], displayWidth-textGap + textWidth("Season: "), displayHeight*67/72);
textAlign(CENTER);
textSize(titleTextSize);
text("Stats", displayWidth-infoPanelWidth/2, displayHeight*109/144);
text(currentTitle, displayWidth-infoPanelWidth/2, displayHeight*11/72);
}

void updateInfo(Tile t)
{
int currentPosition = 12;
currentTitle = (t==null ? "None" : t.getTerrainName());
if(t!=null)
{
int[] tileEffects = t.getTerrainMultiplier();
textSize(paragraphTextSize);
fill(textColor);
textAlign(CENTER);
text(getFlavorText(t), displayWidth-textGap/2, displayHeight*(currentPosition+=1)/72);
textAlign(LEFT);
text("Garden: " + tileEffects[1] + "x Production", displayWidth-textGap, displayHeight*(currentPosition+=3)/72);
text("Village: " + tileEffects[2] + "x Production", displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
text("Factory: " + tileEffects[3] + "x Production", displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
fill(panelColor);
textSize(titleTextSize);
textAlign(CENTER);
if(t.getBuilding() != null) { 
Building building = t.getBuilding();
    //TODO: need to add bulding multipliers to production cost 
    // for the lited building (using inline logical statements)
    textSize(titleTextSize);
    textAlign(CENTER);
    fill(textColor);
    text(building.getBuildingName(), displayWidth-infoPanelWidth/2, displayHeight*(currentPosition+=3)/72);
    textAlign(LEFT);
    textSize(paragraphTextSize);
    currentPosition+=1;
    if(building.getSeedUpkeep()!=0)
    text("Seed cost per Turn: " + building.getSeedUpkeep(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getFoodUpkeep()!=0)
    text("Food cost per Turn: " + building.getFoodUpkeep(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getSeedProd()!=0)
    text("Seed gained per Turn: " + building.getSeedProd() +(tileEffects[building.getBuildingType()] == 1 ? "" : " (x" + tileEffects[building.getBuildingType()] + ")") , displayWidth-textGap, displayHeight*(currentPosition+=2)/72);  
    if(building.getFoodProd()!=0)
    text("Food gained per Turn: " + building.getFoodProd() + (tileEffects[building.getBuildingType()] == 1 ? "" : " (x" + tileEffects[building.getBuildingType()] + ")"), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getDandProd()!=0)
    text("Golden Dandies per Turn: " + building.getDandProd() + (tileEffects[building.getBuildingType()] == 1 ? "" : " (x" + tileEffects[building.getBuildingType()] + ")")    , displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    
    
}


}
// text("Terrain:");
}
// seedCost = seedCostIn;
// foodCost = foodCostIn;
// seedUpkeep = seedUpkeepIn;
// foodUpkeep = foodUpkeepIn;
// seedProd = seedProdIn;
// foodProd = foodProdIn;
// dandProd = dandProdIn;
void updateInfoB(Squares s) {
    fill(textColor);
    if(s!=null) {
    Building building = s.getBuilding();
    currentTitle= s.getBuilding().getBuildingName();
    drawInfoPanel();
    int currentPosition = 12;
    textAlign(LEFT);
    textSize(paragraphTextSize);
    if(building.getSeedCost()!=0)
    text("Seed cost to build: " + building.getSeedCost(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getFoodCost()!=0)
    text("Food cost to build: " + building.getFoodCost(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getSeedUpkeep()!=0)
    text("Seed cost per Turn: " + building.getSeedUpkeep(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getFoodUpkeep()!=0)
    text("Food cost per Turn: " + building.getFoodUpkeep(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getSeedProd()!=0)
    text("Seed gained per Turn: " + building.getSeedProd(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getFoodProd()!=0)
    text("Food gained per Turn: " + building.getFoodProd(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getDandProd()!=0)
    text("Golden Dandies per Turn: " + building.getDandProd(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
}}

void infoPaneStart()
{
    updateTotals();
    infoRan=true;
infoPanelWidth=displayWidth*5.5/26.5;
infoPanelHeight=displayHeight*5/9;

seasonPanelWidth=infoPanelWidth;
seasonPanelHeight=displayHeight*2/9;
textGap=infoPanelWidth - infoPanelWidth/30;
textFont(fb);

}

String getSeason()
{
    if(turnNum%4==0)
    {   currentSeasonArray=new String[]{"Pretty","Golden","Flower","Time"};
        return "Pretty Golden Flower Time";
    }
    else if(turnNum%4==1)
    {
        currentSeasonArray=new String[]{"The","Really","Hot","Time"};
        return "The Really Hot Time";
    }
    else if(turnNum%4==2)
    {
        currentSeasonArray=new String[]{"Crunchy","Brown","Leaves","Time"};
        return "Crunchy Brown Leaves Time";
    }
    else
    {
        currentSeasonArray=new String[]{"Wet","Cold","Icky","Time"};
        return "Wet Cold Icky Time";
    }
}

String getFlavorText(Tile t)
{
    switch(t.getTerrain())
    {
    case 0:
    return "The Water Seems Very Deep";
    case 1:
    return "The Land Seems So Fertile";
    case 2:
    return "Perfect Place For A Family";
    case 3:
    return "Optimal For Dumping Sludge";
    case 4:
    return "Sadly Nothing Special Here";
    }
    return "";
}
