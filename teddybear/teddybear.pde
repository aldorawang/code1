import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
Bear [] myBears = new Bear[5];
Devil [] myDevils = new Devil[5];
Big [] myBig = new Big[1];
Small [] mySmall = new Small[1];
Basket myBasket;
//ArrayList<Ball>myBalls = new ArrayList<Ball>();
int screen;
int score;
int time;
int timer;
int HS;

void setup() {
  size(600, 600);
  frameRate(60);
  minim = new Minim(this);
  player = minim.loadFile("teddybearbackground.mp3");
  player.play();
  player2 = minim.loadFile("bear.mp3");
  player3 = minim.loadFile("devil.mp3");

  myBasket = new Basket();

  //for (int i = 0; i < 20; i ++) {
  //  myBalls.add(new Ball());
  //}
  for (int i = 0; i < 5; i++) {
    myBears[i] = new Bear();
  }
  for (int i = 0; i < 5; i++) {
    myDevils[i] = new Devil();
  }
  for (int i = 0; i < 1; i++) {
    myBig[i] = new Big();
  }
  for (int i = 0; i < 1; i++) {
    mySmall[i] = new Small();
  }
}

void draw() {
  switch(screen) {
  case 0:
    startScreen();
    break;
  case 1:
    gameScreen();
    break;
  case 2:
    overScreen();
    break;
  }
}

void mousePressed() {
  if (screen == 0) {
    if (dist(mouseX, mouseY, width/2, height/2+100)<25) {
      screen = 1;
      time = 0;
      myBasket.size = 50;
    }
  }
  if (screen == 2) {
    if (dist(mouseX, mouseY, width/2, height/2+150)<25) {
      screen = 0;
      for (int i = 0; i < 5; i++) {
        myBears[i] = new Bear();
      }
      for (int i = 0; i < 5; i++) {
        myDevils[i] = new Devil();
      }
      for (int i = 0; i < 1; i++) {
        myBig[i] = new Big();
      }
      for (int i = 0; i < 1; i++) {
        mySmall[i] = new Small();
      }
      score = 0;
    }
  }
}

void startScreen() {
  background(255);
  fill(255, 195, 112);
  ellipse(width/2, height/2+100, 50, 50);
  fill(209, 121, 0);
  text("Are you ready to save the Teddy Bears? If yes press the button to start the game!", 70, height/2);
  noStroke();
  ellipse(width/2, height/2+100, 40, 40);
}

void gameScreen() {
  //noCursor();
  time ++;
  background(255);
  fill(209, 121, 0);
  text("score:", 500, 50);
  text(score, 550, 50);
  text("time:", 500, 75);
  timer = 60 - time/60;
  text(timer, 550, 75);

  for (int i = 0; i < 5; i ++) {
    myBears[i].drawBear();
    myBears[i].move();
    if (myBasket.xPos+myBasket.size > myBears[i].xPos+25 && myBasket.xPos < myBears[i].xPos+25 
      && myBasket.yPos+myBasket.size > myBears[i].yPos && myBasket.yPos < myBears[i].yPos) {
      score = score + 5;
      myBears[i]= new Bear();
      player2.play();
      player2.rewind();
    }
  }
  for (int i = 0; i < 5; i ++) {
    myDevils[i].drawDevil();
    myDevils[i].move();
    if (myBasket.xPos+myBasket.size > myDevils[i].xPos+25 && myBasket.xPos < myDevils[i].xPos+25 
      && myBasket.yPos+myBasket.size > myDevils[i].yPos && myBasket.yPos < myDevils[i].yPos) {
      screen = 2;
      player3.play();
      player3.rewind();
    }
  }

  myBasket.drawBasket();
  myBasket.move();

  //if (keyPressed) {
  //  a = myBasket.getxPos();
  //  myBalls.add(new Ball());
  //}

  //for (int i = 0; i < myBalls.size(); i ++) {
  //  Ball ballX = myBalls.get(i);
  //  ballX.drawBall();
  //  ballX.move();
  //}
  if (myBasket.size < 1) {
    screen = 2;
  }

  if (timer < 1) {
    screen = 2;
  }
}

void overScreen() {
  cursor();
  background(255);
  fill(255, 195, 112);
  ellipse(width/2, height/2+150, 50, 50);
  fill(209, 121, 0);
  text("Game Over :(", 265, height/2+50);
  text("Press the button and try again!", 210, height/2+100);
  text("your score:", 260, 200);
  text(score, 335, 200);

  if (score > HS) {
    HS = score;
  }

  text("highest score:", 243, 250);
  text(HS, 335, 250);
  ellipse(width/2, height/2+150, 40, 40);
}
