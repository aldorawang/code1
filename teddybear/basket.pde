PImage img3;

class Basket {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int size = 50;

  Basket() {
    img3 = loadImage("basket.png");
    xPos = mouseX-25;
    yPos = height-size;
  }

  //float getxPos() {
  //  return xPos;
  //}

  void drawBasket() {
    image(img3, xPos, yPos, size, size);

    for (int i = 0; i < 1; i++) {
      myBig[i].drawBig();
      myBig[i].move();
      if (myBasket.xPos+size > myBig[i].xPos+25 && myBasket.xPos < myBig[i].xPos+25 
        && myBasket.yPos+size > myBig[i].yPos && myBasket.yPos < myBig[i].yPos) {
        myBig[i]= new Big();
        size = size + 10;
        yPos = height-size;
      }
    }
    for (int i = 0; i < 1; i++) {
      mySmall[i].drawSmall();
      mySmall[i].move();
      if (myBasket.xPos+size > mySmall[i].xPos+25 && myBasket.xPos < mySmall[i].xPos+25 
        && myBasket.yPos+size > mySmall[i].yPos && myBasket.yPos < mySmall[i].yPos) {
        mySmall[i]= new Small();
        size = size - 10;
        yPos = height-size;
      }
    }
  }

  void move() {
    if (mouseX-25 > width-size) {
      xPos = width-size;
      yPos = height-size;
    } else if(mouseX-25 < 0) {
      xPos = 0;
      yPos = height-size;
    } else {
      xPos = mouseX-25;
      yPos = height-size;
    }
  }
}
