void gameOver() {
    background(255);

  //text setup and display code
  pauseText = new Text("Berd has perished in battle", width/2, (height/2)-100, black, 190, font);
  pauseText.show();

  //resume and restart button setup and display code
  restartButton  = new Button("Restart", (width/2), (height/2)+271, 150, 80, 255, #FF0000, 37);
  restartButton.show();
}

void gameoverClicks() {
}
