void toggleSound() {
  mute = false;
  if (key == 'm' || key=='M') {
    efeito.pause();
    image(muteIcon, 40, 40);
  }
  if (key == 'l' || key=='L') {
    mute = false;
    image(soundOn, 40, 40);
    efeito.play();
  }
}
