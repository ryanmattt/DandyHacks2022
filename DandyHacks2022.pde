int gameScreen = 2;
PFont f;  
PImage spaceBackground;

void setup() {
 fullScreen();
 f = createFont("Arial", 80, true);
// startButton = loadImage("start.svg");
}

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    startScreen();
  } else if (gameScreen == 1) {
    infoScreen();
  } else if (gameScreen == 2) {
    startGame();
  }
}

void startScreen() {
  // light gray currently
  background(50);
  textFont(f, 80);
  // orange currently
  fill(204, 102, 0);   
  textAlign(CENTER, CENTER);
  text("Click to start", width / 2, height / 2);
  
  // image(startButton, 0, 0, width / 3, height / 7);
}

// }

void infoScreen() {
  // codes of game screen
}
