int gameScreen = 2;
PFont f, fb;  
PImage startBackground;
PImage ball, background, title, startButton, quitButton, startButtonTint, quitButtonTint, waterTexture, forestTexture, lushTexture, mountainTexture, plainsTexture;
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
    tutorialScreen();
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



void infoScreen() {
  textAlign(CENTER, CENTER);
  textFont(f, 80);
  fill(204, 102, 0);
  text("You are a guinea pig voyaging into space after humankind nuked itself, and Earth, into nuclear oblivion. As your motherball lands on an unknown planet it is up to you and your fellow guinea pigs to terraform the planet and build a thriving community. From your small stock of seeds, you will strive to grow your community into a successful colony...", 0, 0);
}

void mousePressed() {
if (gameScreen == 0 && checkButtons(displayWidth*11/26.5, displayHeight*1/5, buttonWidth, buttonHeight)) {
    gameScreen = 2;  
    }
else if (gameScreen == 0 && checkButtons(displayWidth*19/26.5, displayHeight*1/5, buttonWidth, buttonHeight)) {
    exit();  
    }
// else if(gameScreen == 2 && currentHoverBuilding != null && currentHoverBuilding != currentBuilding) {
//   //set building in current square to currentBuilding
//   currentBuilding = currentHoverBuilding;
// }
// else if (gameScreen == 2 && currentBuilding != null && currentHover != null) {
//    placeBuilding(currentBuilding, currentHover);
// }
// else if (gameScreen == 2 && checkButtons())
      // nextTurn();
}



boolean checkButtons(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } else {
    return false;
  }
}

void tutorialScreen() {
  textAlign(CENTER, CENTER);
  textFont(f, 80);
  fill(204, 102, 0);
  text("In this game, the goal is to win by collecting seeds, food, and special goldenflowers to  build a flourishing community. Collect seeds to grow food and build factories to make goldenflowers! Use your resources to expand across the board while utilizing the space to your advantage. But keep a watch out for environmental risks. ", 0, 0);
}

void endScreen() {

}