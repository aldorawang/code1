PImage img2;

class Devil {
  float xPos, yPos;
  float xSpeed, ySpeed;

  Devil() {
    img2 = loadImage("devil.png");
    xPos = random(0, width-200);
    yPos = -50;
    ySpeed = random(2, 5);
  }

  void drawDevil() {
    image(img2, xPos, yPos, 50, 50);
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
