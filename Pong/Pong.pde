int screenWidth = 800;
int screenHeight = 600;

float ballX = screenWidth/2-5; //ball pos
float ballY = screenHeight/2-10;

float p1W = 10; //player 1 starting size and pos
float p1H = 65;
float p1X = 50;
float p1Y = (screenHeight/2)-(p1H/2);

float p2W = 10; //player 2 starting size and pos
float p2H = 65;
float p2X = screenWidth-50;
float p2Y = (screenHeight/2)-(p2H/2);

boolean wPressed = false;
boolean sPressed = false;
boolean upPressed = false;
boolean downPressed = false;

int startingDirection = int(random(1,2));
int score;
float playerSpeed = 10;
float ballSpeed = 20;

//Using the settings function because only with this I can use the size function with variables. 
//This allows for setting up variables properly at the beginning of the script.
void settings(){
  size(screenWidth,screenHeight);
}

void setup(){
  noStroke();
  frameRate(60); //Can't have a varying framerate because the speed of things happening in the game would be affected
}                //I can have varying framerates if there would be a deltaTime variable. Sadly there isn't one accesible

void draw(){
  background(0);
  UpdateLocation();
  DrawSprites();
}


//I must use the keyPressed and keyReleased functions so that the game can handle multiple inputs at the same time.
void keyPressed() {
  if (keyCode == UP) {
    upPressed = true;
  }
  else if (keyCode == DOWN) {
    downPressed = true;
  }
  else if (key == 'w') {
    wPressed = true;
  }
  else if (key == 's') {
    sPressed = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    upPressed = false;
  }
  else if (keyCode == DOWN) {
    downPressed = false;
  }
  else if (key == 'w') {
    wPressed = false;
  }
  else if (key == 's') {
    sPressed = false;
  }
}

void DrawSprites(){
  square(ballX, ballY, 10); //Ball
  
  rect(p1X,p1Y,p1W,p1H); //Player 1
  rect(p2X,p2Y,p2W,p2H); //Player 2
  
  for (int i=0;i<height/20;i++){ //Middleline
    square(width/2-5,20*i,10);
  }
}

void UpdateLocation(){

  if (wPressed && p1Y > 0) {
    p1Y = p1Y-1*playerSpeed;
  }
  
  if (sPressed && p1Y < height-p2H) {
    p1Y = p1Y+1*playerSpeed;
  }
  
  if (upPressed && p2Y > 0) {
    p2Y = p2Y-1*playerSpeed;
  }
  
  if (downPressed && p2Y < height-p2H) {
    p2Y = p2Y+1*playerSpeed;
  }

  }
