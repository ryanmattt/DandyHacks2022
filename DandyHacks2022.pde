int gameScreen = 0;
PFont f, fb;  
PImage startBackground;
PImage ball, background, title, startButton, quitButton, startButtonTint, quitButtonTint, waterTexture, forestTexture, lushTexture, mountainTexture, plainsTexture, motherball, garden, village, factory;
PImage nextTurn, nextTurnTint, continueButton, continueButtonTint, tutorial;
PImage spring, summer, fall, winter;
PImage loss,win, survive;
float buttonHeight= displayHeight/10;
float buttonWidth = displayWidth/5;
boolean hasStartRendered = false;
int turnCounter = 0;
public color panelColor = color(255, 255, 255);
public color textColor = color(0, 0, 0);
public color backgroundColor = color(41,	31,	102, 1);
boolean endScreenHasRun= false;


void setup() {
 fullScreen();
 background(backgroundColor);
 fb = createFont("assets/Courier BOLD.ttf", 80, true);
 textFont(fb, 100);
 text("Loading...", displayWidth/2- textWidth("Loading...")/2, displayHeight/2);
 f = createFont("assets/Courier.ttf", 80, true);
 ball = loadImage("assets/ball.png");
 background = loadImage("assets/background.png");
 title = loadImage("assets/title.png");

 startButtonTint = requestImage("assets/startButtonTint.png");
 quitButtonTint = requestImage("assets/exitButtonTint.png");
//  spring = loadImage("assets/Backgrounds/springBackground.png");
//  summer = loadImage("assets/Backgrounds/summerBackground.png");
//  fall = loadImage("assets/Backgrounds/fallBackground.png");
//  winter = loadImage("assets/Backgrounds/winterBackground.png");
  tutorial = requestImage("assets/howToPlay.png");

 buttonHeight= displayHeight/10;
 buttonWidth = displayWidth/5;
}

void draw() {
  // Display the contents of the image
  if (gameScreen == 0) {
    startScreen();
  } else if (gameScreen == 1) {
    infoScreen();
  } else if (gameScreen == 2) {
    startGame();
  }
  else if (gameScreen == 3) {
    endScreen();
  }
}

void startScreen() {

  if(!hasStartRendered){

  image(background,displayWidth-displayHeight*16/9,0,displayHeight*16/9,displayHeight);
  image(ball,0,0,displayWidth,displayWidth*9/16);
  image(title,0,0,displayWidth,displayWidth*9/16);
  hasStartRendered=true;
  waterTexture = loadImage("assets/waterTexture.png");
 forestTexture = loadImage("assets/forestTexture.png");
 lushTexture = loadImage("assets/lushTexture.png");
 mountainTexture = loadImage("assets/mountainTexture.png");
 plainsTexture = loadImage("assets/plainsTexture.png");
 motherball = loadImage("assets/Motherball.png");
 garden = loadImage("assets/Garden.png");
 village = loadImage("assets/Village.png");
 factory = loadImage("assets/Dandie Factory.png");
 nextTurn = loadImage("assets/nextTurnButton.png");
 nextTurnTint = loadImage("assets/nextTurnButtonTint.png");
 continueButton = loadImage("assets/continueButton.png");
 continueButtonTint = loadImage("assets/continueButtonTint.png");
 
  startButton = loadImage("assets/startButton.png");
 quitButton = loadImage("assets/exitButton.png");
  }
  if(checkButtons(displayWidth*11/26.5, displayHeight*1/5, buttonWidth, buttonHeight))
  image(startButtonTint, displayWidth*11/26.5, displayHeight*1/5, buttonWidth, buttonHeight) ;
  else
  image(startButton, displayWidth*11/26.5, displayHeight*1/5, buttonWidth, buttonHeight) ;
  
 
  if(checkButtons(displayWidth*19/26.5, displayHeight*1/5, buttonWidth, buttonHeight))
  image(quitButtonTint,displayWidth*19/26.5, displayHeight*1/5, buttonWidth, buttonHeight);
  else
  image(quitButton,displayWidth*19/26.5, displayHeight*1/5, buttonWidth, buttonHeight);
  
  //image(startBackground,0,0);
  //startBackground.resize(displayWidth, displayHeight);


  
  // image(startButton, 0, 0, width / 3, height / 7);
}



void mousePressed() {
if (gameScreen == 0 && checkButtons(displayWidth*11/26.5, displayHeight*1/5, buttonWidth, buttonHeight)) {
    gameScreen = 1;  
    }
else if (gameScreen == 0 && checkButtons(displayWidth*19/26.5, displayHeight*1/5, buttonWidth, buttonHeight)) {
    exit();  
    }
else if (gameScreen == 1 && checkButtons(displayWidth - displayWidth/50 - buttonWidth*5/6 , displayHeight/50, buttonWidth * 5/6, buttonHeight * 5/6)) {
    gameScreen = 2; 
    clear();
    background(backgroundColor);
    }
else if(gameScreen == 2 && currentHoverBuilding != null) {
  //set building in current square to currentBuilding
  currentBuilding = currentHoverBuilding;
}
else if (gameScreen == 2 && currentBuilding != null && currentHover != null) {
   placeBuilding(currentBuilding, currentHover);
   runDrawBackAndTiles=true;
}
else if (gameScreen == 2 && currentBuilding != null && currentHover == null) {
   currentBuilding = null;
   runDrawBackAndTiles=true;
}
else if (gameScreen == 2 && checkButtons(displayWidth/200, displayHeight-displayHeight*3/20 , buttonWidth, buttonHeight)) {
    nextTurn();
    runDrawBackAndTiles=true;

}
else if ((gameScreen == 2 || gameScreen == 3 )&& checkButtons(displayWidth/50,displayHeight/50, buttonWidth, buttonHeight)) {
    exit();
    }
}


boolean checkButtons(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } else {
    return false;
  }
}

void endScreen() {
  

  if(!endScreenHasRun) endScreenRun();
  renderTopLeftQuit();
}

void endScreenRun()
{
  clear();
  background(backgroundColor);
if(lost == true){
    image(loss,0,0,displayWidth,displayWidth * 9/16);
  }
  else if(dand>=dandiesToWin) {
    image(win,0,0,displayWidth,displayWidth * 9/16);
  }
  else{
    image(survive,0,0,displayWidth,displayWidth * 9/16);
  }
  endScreenHasRun=true;
}

void renderTopLeftQuit()
{
  float buttonX = displayWidth/200;
  float buttonY = displayHeight/50;

  if(checkButtons(buttonX, buttonY, buttonWidth, buttonHeight))
  image(quitButtonTint,buttonX, buttonY, buttonWidth, buttonHeight);
  else
  image(quitButton,buttonX, buttonY, buttonWidth, buttonHeight);
}