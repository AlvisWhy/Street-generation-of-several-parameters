//color building = (180,120,120);
//color sideway = (235,255,7);
//color tree = (4,200,3);
int mode=-1;
float sideway = 2.5;
float velocity = 0.25;
ArrayList <building> road1 = new ArrayList <building>();
ArrayList <building> road2 = new ArrayList <building>();
int time = 0;

void setup() {
  frameRate(24);
  size(1280, 1280, P3D);
  //sky color
  background(6, 230, 230);
  String[] lines = loadStrings("building1.txt");
  String[] lines2 = loadStrings("building2.txt");
  for (int i =0; i< lines.length; i++) {
    String[] pieces = split(lines[i], ',');
    road1.add(new building(float(pieces[0]), float(pieces[1]), float(pieces[2]), float(pieces[3])));
  }
  for (int i =0; i< lines.length; i++) {
    String[] pieces = split(lines2[i], ',');
    road2.add(new building(float(pieces[0]), float(pieces[1]), float(pieces[2]), float(pieces[3])));
  }
}

void draw() {

  //lights();
float cameX = time*velocity;

  if ( mode == 1) {

    camera(cameX, 0, 1.7, 1000, 0, 1.7, 0, 0, -1);

    float fov = PI*2/3;
    float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(fov, float(width)/float(height), cameraZ/30.0, cameraZ*1.0);
  }

  if ( mode == -1) {

    float move = 8*cameX;
    camera(move, 0, -150, 10000, 0, -150, 0, 0, -1);

    float fov = PI*2/3;
    perspective(fov, 1, 1, 5000);

    scale(8);
    translate(0, 0, -20);
  }

  background(6, 230, 230);

  //draw road

  pushStyle();
  fill(140, 140, 140);
  noStroke();
  rect(road1.get(0).startX-0.5*road1.get(0).Width, road1.get(0).startY, road2.get(road2.size()-1).startX+0.5*road2.get(road2.size()-1).Width, road2.get(road2.size()-1).startY);
  rect(road2.get(0).startX-0.5*road2.get(0).Width, road2.get(0).startY, road1.get(road1.size()-1).startX +0.5*road1.get(road1.size()-1).Width, road1.get(road1.size()-1).startY);
  popStyle();
  //draw road

  //draw sideway
  pushStyle();
  fill(235, 255, 7);
  noStroke();
  pushMatrix();
  translate(0, 0, 0.01);
  rect(road1.get(0).startX, road1.get(0).startY, road2.get(road2.size()-1).startX, sideway);
  rect(road2.get(0).startX, road2.get(0).startY, road1.get(road1.size()-1).startX, -1*sideway);
  popStyle();

  popMatrix();
  //draw sideway

  //draw buildings

  pushStyle();
  noStroke();
  fill(180, 120, 120);

  for (int i =0; i< road1.size(); i++) {
    pushMatrix();
    translate(road1.get(i).startX, road1.get(i).startY-2.5, road1.get(i).Height*0.5);
    box(road1.get(i).Width, 5, road1.get(i).Height);
    popMatrix();
  }
  for (int i =0; i< road2.size(); i++) {
    pushMatrix();
    translate(road2.get(i).startX, road2.get(i).startY+2.5, road2.get(i).Height*0.5);
    box(road2.get(i).Width, 5, road2.get(i).Height);
    popMatrix();
  }
  popStyle();
  //draw buildings

  //draw trees
  pushStyle();
  fill(4, 200, 3);
  noStroke();
  randomSeed(0);
  for (int i = 0; i<5; i++) {
    pushMatrix();
    translate(random(road1.get(0).startX, road1.get(road1.size()-1).startX), road1.get(0).startY+sideway, 4);
    ;
    sphere(2);
    popMatrix();
  }
  for (int i = 0; i<5; i++) {
    pushMatrix();
    translate(random(road2.get(0).startX, road1.get(road2.size()-1).startX), road2.get(0).startY-sideway, 4);
    sphere(2);
    popMatrix();
  }
  popStyle();
  //draw trees

  if ( mode == 1) {
    camera(0, 0, 100, 0, 0, 0, 0, 100, 0);
    ortho(-width/2.0, width/2.0, -height/2.0, height/2.0, 10, 200);



    pushMatrix();
    scale(3);
    translate(-80, 80, 0);

    pushStyle();
    fill(140, 140, 140);
    noStroke();
  rect(road1.get(0).startX-0.5*road1.get(0).Width, road1.get(0).startY, road2.get(road2.size()-1).startX+0.5*road2.get(road2.size()-1).Width, road2.get(road2.size()-1).startY);
  rect(road2.get(0).startX-0.5*road2.get(0).Width, road2.get(0).startY, road1.get(road1.size()-1).startX +0.5*road1.get(road1.size()-1).Width, road1.get(road1.size()-1).startY);
    popStyle();


    //draw sideway
    pushStyle();
    fill(235, 255, 7);
    noStroke();
    rect(road1.get(0).startX-0.5*road1.get(0).Width, road1.get(0).startY, road2.get(road2.size()-1).startX+0.5*road2.get(road2.size()-1).Width, sideway);
    rect(road2.get(0).startX-0.5*road2.get(0).Width, road2.get(0).startY, road1.get(road1.size()-1).startX+0.5*road1.get(road1.size()-1).Width, -1*sideway);
    popStyle();

    //draw buildings

    //draw trees
    pushStyle();
    fill(4, 200, 3);
    noStroke();
    randomSeed(0);
    for (int i = 0; i<5; i++) {
      pushMatrix();
      translate(random(road1.get(0).startX, road1.get(road1.size()-1).startX), road1.get(0).startY+sideway, 4);
      sphere(2);
      popMatrix();
    }
    for (int i = 0; i<5; i++) {
      pushMatrix();
      translate(random(road2.get(0).startX, road1.get(road2.size()-1).startX), road2.get(0).startY-sideway, 4);
      sphere(2);
      popMatrix();
    }
    popStyle();
    //draw trees

    //draw location
    pushStyle();
    fill(255,0,0);
    noStroke();
    circle(cameX,0,2);
    popStyle();
    //draw location



    pushStyle();

    fill(180, 120, 120);

    for (int i =0; i< road1.size(); i++) {
      pushMatrix();
      translate(road1.get(i).startX, road1.get(i).startY-2.5, road1.get(i).Height*0.5);
      box(road1.get(i).Width, 5, road1.get(i).Height);
      popMatrix();
    }
    for (int i =0; i< road2.size(); i++) {
      pushMatrix();
      translate(road2.get(i).startX, road2.get(i).startY+2.5, road2.get(i).Height*0.5);
      box(road2.get(i).Width, 5, road2.get(i).Height);
      popMatrix();
    }
    popStyle();

    popMatrix();
  }

  time += 1;
  saveFrame("####.jpg");
}


void mousePressed() {
  mode *= -1;
}

class building {
  float Height;
  float startX;
  float startY;
  float Width;

  building(float wid, float h, float sy, float sx) {
    Height = h;
    startX = sx;
    startY = sy;
    Width = wid;
  }
}


//read csv
//create bodys
//set travel line
//output pic
