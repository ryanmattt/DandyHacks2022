int gameScreen = 2;
PFont f, fb;  
PImage startBackground;
PImage ball, background, title, startButton, quitButton, startButtonTint, quitButtonTint, waterTexture, forestTexture, lushTexture, mountainTexture, plainsTexture, motherball, garden, village, factory;
PImage nextTurn, nextTurnTint, continueButton, continueButtonTint, tutorial;
PImage spring, summer, fall, winter;
float buttonHeight= displayHeight/10;
float buttonWidth = displayWidth/5;
boolean hasStartRendered = false;
int turnCounter = 0;

void setup() {
 fullScreen();
 f = createFont("assets/Courier.ttf", 80, true);
 fb = createFont("assets/Courier BOLD.ttf", 80, true);
 ball = loadImage("assets/ball.png");
 background = loadImage("assets/background.png");
 title = loadImage("assets/title.png");
 startButton = loadImage("assets/startButton.png");
 quitButton = loadImage("assets/exitButton.png");
 startButtonTint = loadImage("assets/startButtonTint.png");
 quitButtonTint = loadImage("assets/exitButtonTint.png");
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
spring = loadImage("assets/Backgrounds/springBackground.png");
summer = loadImage("assets/Backgrounds/summerBackground.png");
fall = loadImage("assets/Backgrounds/fallBackground.png");
winter = loadImage("assets/Backgrounds/winterBackground.png");
tutorial = loadImage("assets/howToPlay.png");

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
    gameScreen = 2;  
    }
else if (gameScreen == 0 && checkButtons(displayWidth*19/26.5, displayHeight*1/5, buttonWidth, buttonHeight)) {
    exit();  
    }
  // else if (gameScreen == 1 && checkButtons(insert when correct)) {

 // }
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
else if (gameScreen == 2 && checkButtons(buttonWidth/4, displayHeight-displayHeight*3/20 , buttonWidth, buttonHeight)) {
    nextTurn();
    runDrawBackAndTiles=true;

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
  clear();
  textAlign(CENTER, CENTER);
  textFont(f, 80);
  fill(204, 102, 0);
  text("In this game, the goal is to win by collecting seeds, food, and special goldenflowers to  build a flourishing community. Collect seeds to grow food and build factories to make goldenflowers! Use your resources to expand across the board while utilizing the space to your advantage. But keep a watch out for environmental risks. ", 0, 0);
}
