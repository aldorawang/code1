PImage img4;

class Big {
  float xPos, yPos;
  float xSpeed, ySpeed;

  Big() {
    img4 = loadImage("big.png");
    xPos = random(0, width-200);
    yPos = -50;
    ySpeed = random(1, 2);
  }

  void drawBig() {
    image(img4, xPos, yPos, 50, 50);
  }

  void move() {
    yPos += ySpeed;
    if (yPos > height) {
      yPos = -50;
      ySpeed += 0.15;
      xPos = random(0, width-200);
    }
  }
}
