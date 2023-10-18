class Snake {
  int x, y, w, h;
  color c;
  
  Snake(int _x, int _y,int _w, int _h, color _c){
    x= _x;
    y= _y;
    w= _w;
    h= _h;
    c= _c;
  }
  
  void show(int vx, int vy){
    x += vx*w;
    y += vy*h;
    fill(c);
    rect(x,y,w,h,1);
  }
  
}
