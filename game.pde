void game() {
      image(img4, width/2, height/2-20);

  for (int i = tam-1; i >= 0; i-- ) {
    if (i == 0) {
      sn[i].show(x, y);
    } else {
      sn[i].x = sn[i-1].x;
      sn[i].y = sn[i-1].y;
      sn[i].show(0, 0);
    }
    if ((i > 4 && sn[0].x == sn[i].x && sn[0].y == sn[i].y) ||
      sn[0].x < 0 ||  sn[0].y < 0 || sn[0].x > width-szSn || sn[0].y > height-szSn) {
      start = false;
    }
  }
  food.show(0, 0);

  // pegando comida
  if (sn[0].x == food.x && sn[0].y == food.y) {
    pts += 15;
    if (pts > top) top = pts;
    piece();
  }
}
