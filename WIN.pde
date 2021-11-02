void win() {
  background(255);
  //win
  winText = new Text(" Berd Returned Home \nwith Treasure Galore", width/2, (height/2)-100, black, 150, font);
  winText.show();

  restartButton  = new Button("Return To Family", width/2, (height/2)+271, 300, 80, 255, #FF0000, 37);
  restartButton.show();
}

void winClicks() {
  if (restartButton.clicked) {
    mode = INTRO;
  }
}
