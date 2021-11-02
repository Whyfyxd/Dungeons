void pause() {
  background(255);

  //text setup and display code
  pauseText = new Text("Berd is Resting", width/2, (height/2)-100, black, 190, font);
  pauseText.show();

  //resume and restart button setup and display code
  resumeButton  = new Button("Onwards", (width/2)-150, (height/2)+271, 150, 80, 255, #FF0000, 37);
  resumeButton.show();
  restartButton  = new Button("Cower", (width/2)+150, (height/2)+271, 150, 80, 255, #FF0000, 37);
  restartButton.show();
}

void pauseClicks() {
  //resume and restart button interaction code
  if (resumeButton.clicked) {
    mode = GAME;
  }
  if (restartButton.clicked) {
    mode = INTRO;
  }
}
