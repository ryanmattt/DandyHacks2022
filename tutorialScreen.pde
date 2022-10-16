public void infoScreen() {
  textAlign(CENTER, CENTER);
  textFont(f, 80);
  fill(204, 102, 0);
  text("You are a guinea pig voyaging into space after humankind nuked itself, and Earth, into nuclear oblivion. As your motherball lands on an unknown planet it is up to you and your fellow guinea pigs to terraform the planet and build a thriving community. From your small stock of seeds, you will strive to grow your community into a successful colony...", 0, 0);
}

public void drawContinueButton() {
  // fill(255, 0, 0);
    image(continueButton, displayWidth/2, displayHeight-displayHeight*3/20, buttonWidth, buttonHeight);
  // rect(displayWidth/2, displayHeight/1.07, buttonWidth, buttonHeight, 20, 20, 0, 0);
}