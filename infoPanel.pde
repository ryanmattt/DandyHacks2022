public float infoPanelHeight, infoPanelWidth, seasonPanelHeight, seasonPanelWidth;
public boolean infoRan = false;
public String currentTitle = "";
public int paragraphTextSize = 37;
public int titleTextSize = 60;
float textGap;
String currentSeasonArray[] = {};
void drawInfoPanel() {
infoPaneStart();
fill(255,255,255);
rect(displayWidth-infoPanelWidth, displayHeight*1/9, infoPanelWidth, infoPanelHeight, 20,0,0,20);
rect(displayWidth-seasonPanelWidth, displayHeight*13/18, seasonPanelWidth, seasonPanelHeight, 20, 0, 0, 20);

fill(0,0,0);
textAlign(LEFT);
textSize(paragraphTextSize);
text("Food: " + food, displayWidth-textGap, displayHeight*57/72);
text("Seeds: " + seeds, displayWidth-textGap, displayHeight*59/72);
text("Golden Flowers: " + dand, displayWidth-textGap, displayHeight*61/72);
text("Turn Number: " + turnNum, displayWidth-textGap, displayHeight*63/72);
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
textAlign(LEFT);
textSize(paragraphTextSize);
fill(0,0,0);
text("Garden: " + tileEffects[1] + "x production", displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
text("Village: " + tileEffects[2] + "x production", displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
text("Factory: " + tileEffects[3] + "x production", displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
fill(255,255,255);
textSize(titleTextSize);
textAlign(CENTER);
if(t.getBuilding() != null) { 
    //TODO: need to add bulding multipliers to production cost 
    // for the lited building (using inline logical statements)
    Building building = t.getBuilding();
    textSize(titleTextSize);
    textAlign(CENTER);
    fill(0,0,0);
    text(building.getBuildingName(), displayWidth-infoPanelWidth/2, displayHeight*(currentPosition+=4)/72);
    textAlign(LEFT);
    textSize(paragraphTextSize);
    currentPosition+=2;
    if(building.getSeedUpkeep()!=0)
    text("Seed Upkeep: " + building.getSeedUpkeep(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getFoodUpkeep()!=0)
    text("Food Upkeep: " + building.getFoodUpkeep(), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getSeedProd()!=0)
    text("Seed Production: " + building.getSeedProd() +(tileEffects[building.getBuildingType()] == 1 ? "" : "(" + tileEffects[building.getBuildingType()] + "x)") , displayWidth-textGap, displayHeight*(currentPosition+=2)/72);  
    if(building.getFoodProd()!=0)
    text("Food Production: " + building.getFoodProd() + (tileEffects[building.getBuildingType()] == 1 ? "" : "(" + tileEffects[building.getBuildingType()] + "x)"), displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    if(building.getDandProd()!=0)
    text("Dandie Production: " + building.getDandProd() + (tileEffects[building.getBuildingType()] == 1 ? "" : "(" + tileEffects[building.getBuildingType()] + "x)")    , displayWidth-textGap, displayHeight*(currentPosition+=2)/72);
    


}


}
// text("Terrain:");
}

void updateInfoB(Squares s) {
    if(s!=null) {
         currentTitle= s.getBuilding().getBuildingName();
    } 
}

void infoPaneStart()
{
    if(!infoRan)
{
    infoRan=true;
infoPanelWidth=displayWidth*5.5/26.5;
infoPanelHeight=displayHeight*5/9;

seasonPanelWidth=infoPanelWidth;
seasonPanelHeight=displayHeight*2/9;
textGap=infoPanelWidth - infoPanelWidth/30;
textFont(fb);
}
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