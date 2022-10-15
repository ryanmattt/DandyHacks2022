public class tileTraits{
    int traitNum = 0;
    building allowedBuildings;

    tileTraits(int traitNum, building allowedBuildings){
        this.traitNum = traitNum;
        this.allowedBuildings = allowedBuildings;
    }

    public int getTraitMultiplier(){
        if(traitNum==0) //Plains
        { return 1; }
        else if(traitNum==1) //Ocean
        { return 0; }
        else if(traitNum==2)
        { return 2; }
        else if(traitNum==3)
        { return 2; }
        else if(traitNum==4)
        {
        return 2;
        }
        return -1;


    }

    public building getAllowedBuildings(){
        return allowedBuildings;
    }
}