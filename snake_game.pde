

import ddf.minim.*;
Minim gerenciador;

AudioPlayer efeito;
AudioPlayer  efeito1;

int szSn = 40, x=1, y, TInit = 3, tempo, tam, pts, top;
int c, h, startgame= 0;
float ang = 0;
PImage sprite1, sprite2, sprite3, sprite4, sprite5, sprite6;
PImage circle;
PImage img, img1, img2, img3, img4;
PImage soundOn, muteIcon;

// sounds
int  music, eatSound, soundIcon, bonusSound ;
color cor_cobra;

Boolean mute, sp = false;
boolean start, gMenu;
Snake[] sn;
Snake food = new Snake(0, 0, szSn, szSn, #00ff00);

void setup() {
  size(600, 660);
  height = 600;
  frameRate(5);

  sprite1 = loadImage("spt1.png");
  sprite2 = loadImage("spt2.png");
  sprite3 = loadImage("spt3.png");
  sprite4 = loadImage("spt4.png");
  sprite5 = loadImage("spt5.png");
  sprite6 = loadImage("spt6.png");

  img = loadImage("cobra.png");
  img1 = loadImage("historia.png");
  img2 = loadImage("integrantes.png");
  img3 = loadImage("bg.png");
  img4 = loadImage("bg2.png");
  soundOn = loadImage("sound.png");
  muteIcon = loadImage("mute.png");

  circle = loadImage("snake circle.png");

  gerenciador = new Minim(this);
  // Carrega o arquivo de áudio.
  efeito = gerenciador.loadFile("music2.mp3");
  efeito1 = gerenciador.loadFile("music3.mp3");
  efeito.play();
}

void menu() {
  gMenu = false;
  background(21, 23, 44);
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(255);
  image(img3, width/2, height/2-20);
  delay(100);
  efeito.pause();
  
  if (start) {
    x = 1;
    y = 0;
    tam = TInit;
    pts = 0;
    piece();
    gMenu = true;
  }
}

void piece() {
  tam++;
  int[][] xy = new int[2][tam];

  for (int i = 0; i < tam -1; i++) {
    if (tam > TInit + 1) {
      xy[0][i] = sn[i].x;
      xy[1][i] = sn[i].y;
    } else {
      xy[0][i] = szSn*5;
      xy[1][i] = szSn*2;
      ;
    }
  }

  sn = new Snake[tam];
  for (int i = 0; i < tam; i++) {
    sn[i] = new Snake(xy[0][i], xy[1][i], szSn, szSn, cor_cobra);
  }
  newFood();
}

void newFood() {
  boolean f = false;
  while (!f) {
    f = true;
    food.x = int(random(width/  szSn)) * szSn;
    food.y = int(random(height/ szSn)) * szSn;
    for (int i = 0; i < tam; i++) {
      if (food.x == sn[i].x && food.y == sn[i].y)
        f = false;
    }
  }
}

void draw() {
  if (startgame == 0) {
    background(0);
    imageMode(CENTER);
    image(img, width/2, height/2-20);
    textAlign(CENTER);
    fill (255);
    toggleSound();

    if (c == 1) {
      background(255);
      image(img2, width/2, height/2-20);
      textAlign(LEFT);
      pushMatrix();
      translate(50, 200);
      imageMode(CENTER);
      rotate(radians(ang+=1.7));
      image(circle, 0, 0);
      popMatrix();
      pushMatrix();
      translate(550, 200);
      imageMode(CENTER);
      rotate(radians(ang+=1.7));
      image(circle, 0, 0);
      popMatrix();
    } else if (h == 1) {
      background(255);
      image(img1, width/2, height/2-20);
      textAlign(LEFT);
      if ((millis() - tempo) > 150) {
        tempo = millis();
        sp = !sp;
        //background(255);
        image((sp==true)?sprite5:sprite6, 500, 35);
        image((sp==true)?sprite3:sprite4, width/2, 35);
        image((sp==true)?sprite1:sprite2, 100, 35);
      }
    }
  } else {
    background(200, 0, 0);
    textAlign(CENTER);
    fill (0);
    if (start && gMenu) {
      game();
      efeito1.play();
    } else{
      menu();
      efeito1.pause();
      mute = true;
    }

    //painel e pontos
    fill(0);
    rect(0, 600, width, 60);
    fill(255);
    textSize(30);
    textAlign(LEFT);
    text("Pontos "      + pts, 20, 630);
    text("High-Score "  + top, 320, 630);
  }
}
