public float infoPanelHeight, infoPanelWidth, seasonPanelHeight, seasonPanelWidth;
public boolean infoRan = false;
public String currentTitle = "";
float textGap;
String currentSeasonArray[] = {};
void drawInfoPanel() {
infoPaneStart();
fill(255,255,255);
rect(displayWidth-infoPanelWidth, displayHeight*1/9, infoPanelWidth, infoPanelHeight, 20,0,0,20);
rect(displayWidth-seasonPanelWidth, displayHeight*13/18, seasonPanelWidth, seasonPanelHeight, 20, 0, 0, 20);
textFont(fb);
textSize(60);
fill(0,0,0);
text(currentTitle, displayWidth-infoPanelWidth/2, displayHeight*5/36);

textAlign(LEFT);
textSize(38);
text("Food: " + food, displayWidth-textGap, displayHeight*54/72);
text("Seeds: " + seeds, displayWidth-textGap, displayHeight*56/72);
text("Golden Flowers: " + dand, displayWidth-textGap, displayHeight*58/72);
text("Turn Number: " + turnNum, displayWidth-textGap, displayHeight*60/72);
getSeason();
text("Season: " + currentSeasonArray[0] + " " + currentSeasonArray[1], displayWidth-textGap, displayHeight*62/72);
textAlign(CENTER);
textSize(60);

}

void updateInfo(Tile t)
{

currentTitle = (t==null ? "None" : t.getTerrainName());

// text("Terrain:");
}

void updateInfoB(Squares s) {
    if(s!=null) {
         currentTitle= s.getBuilding().getName();
    } 
}

void infoPaneStart()
{
    if(!infoRan)
{
    infoRan=true;
infoPanelWidth=displayWidth*5/26.5;
infoPanelHeight=displayHeight*5/9;

seasonPanelWidth=displayWidth*5/26.5;
seasonPanelHeight=displayHeight*2/9;
textGap=infoPanelWidth-infoPanelWidth/20;
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