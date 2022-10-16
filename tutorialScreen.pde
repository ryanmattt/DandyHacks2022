boolean infoHasStarted = false;

public void infoScreen() {
    if(!infoHasStarted) infoScreenStartUp();
    drawContinueButton();
}

public void drawContinueButton() {
    float buttonW = buttonWidth * 5/6;
    float buttonH = buttonHeight * 5/6;
    float pointX = displayWidth - displayWidth/50 - buttonW;
    float pointY = displayHeight/50;
    if (checkButtons(pointX, pointY, buttonW, buttonH))
    image(continueButtonTint, pointX, pointY, buttonW, buttonH);
    else 
    image(continueButton, pointX, pointY, buttonW, buttonH);
}

public void infoScreenStartUp() {
    infoHasStarted=!infoHasStarted;
    float imgHeight = displayWidth*9/16;
    background(backgroundColor);
    image(tutorial, 0, displayHeight-imgHeight, displayWidth, imgHeight);
}