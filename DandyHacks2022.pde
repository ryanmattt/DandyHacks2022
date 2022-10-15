int gameScreen = 0;

void setup() {
 fullScreen();
}

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    startScreen();
  } else if (gameScreen == 1) {
    infoScreen();
  } else if (gameScreen == 2) {
    gameScreen();
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER, CENTER);
  textSize(128);
  text("Click to start", width/2, height/2);
}

void startGame() {
  if (mouseX > )
}

void infoScreen() {
  // codes of game screen
}
void gameScreen() {
  // codes for game over screen
}