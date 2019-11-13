PImage img5;

class Small {
  float xPos, yPos;
  float xSpeed, ySpeed;

  Small() {
    img5 = loadImage("small.png");
    xPos = random(0, width-200);
    yPos = -50;
    ySpeed = random(1, 2);
  }

  void drawSmall() {
    image(img5, xPos, yPos, 50, 50);
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
