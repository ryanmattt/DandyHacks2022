int gameScreen = 2;
PFont f;  
PImage startBackground;
PShape ball;
PShape background;
PShape title;
PShape startButton;
PShape quitButton;

void setup() {
 fullScreen();
 f = createFont("Arial", 80, true);
 startBackground = loadImage("assets/titleCard.jpg");
 ball = loadShape("assets/titlecardmotherballisolation.svg");
 background = loadShape("assets/background.svg");
 title = loadShape("assets/title.svg");
// startButton = loadImage("start.svg");
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
  background(50);
  shape(background,0,0,displayWidth,displayWidth*(9/16));
  shape(ball,0,0,displayWidth,displayWidth*(9/16));
  shape(title,0,0,displayWidth,displayWidth*(9/16));
  
  

  //image(startBackground,0,0);
  //startBackground.resize(displayWidth, displayHeight);

  
  // image(startButton, 0, 0, width / 3, height / 7);
}



void infoScreen() {
  textAlign(CENTER, CENTER);
  textFont(f, 80);
  fill(204, 102, 0);
  text("You are a guinea pig adventuring into space after the humans nuked themselves and Earth into nuclear oblivion. As your motherball lands on an unknown planet, it is up to you and your fellow guinea pigs to terraform the planet and build a thriving community. From your small stock of seeds, you will grow your community into a successful colony.", 0, 0);
}

void mousePressed() {
// if (gameScreen == 1) {
//  tutorialScreen();
// } else {
// gameScreen == 1;
// }
 }

void tutorialScreen() {
  textAlign(CENTER, CENTER);
  textFont(f, 80);
  fill(204, 102, 0);
  text("In this game, the goal is to win by collecting seeds, food, and special goldenflowers to  build a flourishing community. Collect seeds to grow food and build factories to make goldenflowers! Use your resources to expand across the board while utilizing the space to your advantage. But keep a watch out for environmental risks. ", 0, 0);
}

void endScreen() {

}