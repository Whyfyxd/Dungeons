void intro() {

  //GIF display
  introGIF.show();

  //start button setup and display code
  startButton = new Button("BEGIN ADVENTURE", width/2, (height/2)+271, 400, 83, 255, #FF0000, 50);
  startButton.show();

  //text setup and display code
  introText = new Text("Dungeons & Berds", width/2, (height/2)-100, black, 190, font);
  introText.show();
}

void introClicks() {
  //start button interaction code
  if (startButton.clicked) {
    mode = GAME;
  }
}
