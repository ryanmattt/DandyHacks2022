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

    rect(0, displayHeight/4, barWidth, barHeight, 0, 20, 20, 0);

    for(int i = 0; i < buildingsOnPanel.length; i++) {
        buildingsOnPanel[i].display();
    }
    // sidebar color
    
    fill(255, 255, 0);
    //sidebar
    // square color
    // example squares
    textFont(fb, 30);
    fill(72, 61, 139);
    textAlign(CENTER, CENTER);
    text("Buildings", barWidth/2, barHeight/1.8);
}

class Squares {
    Building squareBuilding;
    float x, y, wh;
    boolean selected;
    Squares(float xIn, float yIn, float whIn, Building buildingIn)
    {
        this.x = xIn;
        this.y = yIn;
        this.wh = whIn;
        this.squareBuilding = buildingIn;
    }
    public void display()
    {
        fill(255, 0, 0);
        square(x, y, wh);
    }

    public boolean mouseInSquare()
    {
        float length = this.getLength();
        if(mouseX > this.x && mouseX < this.x + length && mouseY > this.y && mouseY < this.y + length)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public Building getBuilding()
    {
        return this.squareBuilding;
    }
    public float getX()
    {return x;}
    public float getY()
    {return y;}
    public float getX2()
    {return x + this.getLength();}
    public float getY2()
    {return y + this.getLength();}
    public float getLength()
    {return wh;}

    
}