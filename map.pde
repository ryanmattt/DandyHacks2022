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
  textAlign(CENTER);
  text("Click to start", height/2, width/2);
}
void infoScreen() {
  // codes of game screen
}
void gameScreen() {
  // codes for game over screen
}