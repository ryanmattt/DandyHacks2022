public Building currentBuilding;
float barWidth, barHeight, sqWH;
Squares buildingsOnPanel[] = new Squares[3];
boolean initialBuildingBar = false;

void drawBar() {
    if(!initialBuildingBar)  {
        initialBuildingBar = true;
    barWidth = displayWidth*1/10;
    barHeight = displayHeight*3/6;
    sqWH = displayHeight*1/9;
    buildingsOnPanel[0] = new Squares(barWidth/6, barHeight/1.6, sqWH, baseGarden);
    buildingsOnPanel[1] = new Squares(barWidth/6, barHeight/1.1, sqWH, baseVillage);
    buildingsOnPanel[2] = new Squares(barWidth/6, barHeight/0.84, sqWH, baseFactory);
    }
    fill(255, 255, 255);
    rect(0, displayHeight/4, barWidth, barHeight, 0, 20, 20, 0);

    for(int i = 0; i < buildingsOnPanel.length; i++) {
        buildingsOnPanel[i].display();
    }
    // sidebar color
    
    //sidebar
    // square color
    // example squares
    textFont(fb, paragraphTextSize);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    text("Buildings", barWidth/2, barHeight/1.8);
}
