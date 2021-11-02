void mouseReleased() {
  //mouse input code

  if (mode == INTRO) {
    introClicks();
  } else if (mode ==GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } else if (mode == WIN) {
    winClicks();
  }
}
