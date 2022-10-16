
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
        fill(0, 0, 0, 0);
        image(squareBuilding.getBuildingImage(), x, y, wh, wh);
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