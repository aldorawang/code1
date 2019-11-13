PImage img;

class Bear {
  float xPos, yPos;
  float xSpeed, ySpeed;

  Bear() {
    img = loadImage("bear.png");
    xPos = random(0, width-200);
    yPos = -50;
    ySpeed = random(1, 4);
  }

  void drawBear() {
    image(img, xPos, yPos, 50, 50);
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
