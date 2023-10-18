void keyPressed() {
  if (keyCode == 49) { 

    cor_cobra = color(255, 204, 0);
    start = true;
  };
  if (keyCode == 50) { 
    cor_cobra = color(255, 255, 255);
    start = true;
       frameRate(10);
  };
  if (keyCode == 51) { 
    cor_cobra = color(52, 205, 117);
    frameRate(15);
    start = true;
  };


  if (startgame == 0) {
    if (key == 's' || key=='S') {
      startgame = 1;
      efeito.pause();
    }
    if (key == 'h' || key=='H') {
      if (h == 1)
        h = 0;
      else
        h = 1;
    }
    if (key == 'c' || key=='C') {
      if (c == 1)
        c = 0;
      else
        c = 1;
    }
  }

  if (key == 'v' || key == 'V') {
    startgame = 0;
  }

  if (keyCode == LEFT) {
    x = -1;
    y = 0;
  } else if (keyCode == UP && y == 0) {
    y = -1;
    x = 0;
  } else if (keyCode == RIGHT && x == 0) {
    x = 1;
    y = 0;
  } else if (keyCode == DOWN && y == 0) {
    y = 1;
    x = 0;
  } else if (key == 'a' && !start) start = true;
}
