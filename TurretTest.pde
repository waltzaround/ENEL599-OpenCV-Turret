/* 
Project: Physical Computing Assignment
By Walter Lim
Version 3 Turret

Searches for faces. if face detected, sends case c to pc

Contains modified code from Greg Borenstein under the OpenCV for Processing Project https://github.com/atduskgreg/opencv-processing

*/
import ddf.minim.*;// import Minim library
import gab.opencv.*;// import OpenCV library
import processing.video.*;// import processing video library
import java.awt.*;// import java awt library
import processing.serial.*;
import javax.swing.*;

Minim minim;
Capture video;
OpenCV opencv;

boolean turretMove = false;
AudioInput input;
AudioPlayer sound1;
Serial superSerial;

void setup() {  //begin void setup
  size(640, 480); // set size of sketch to be 640 x 480
  video = new Capture(this, 640/2, 480/2); // declare new video capture stream @ 320 x 240
  opencv = new OpenCV(this, 640/2, 480/2);// declare new OpenCV @ 320 x 240
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  //load more OpenCV code


  video.start();// start video capture

  minim = new Minim(this);// load new minim
  sound1 = minim.loadFile("fire.wav");// declare sound1 to play fire.wav file when called
  input = minim.getLineIn();// acquire line
  sound1.loop(); // loop fire.wav
  
  //set up serial communication, we are super serial
  String[] ports = Serial.list();
  superSerial = new Serial(this, ports[0], 9600);
}// end void setup


void draw() {
  scale(2);
  image(video, 0, 0 );
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);

  opencv.loadImage(video);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }

  if (faces.length == 0) {
    turretMove = true;
    sound1.mute();
    superSerial.write(0);
  } else {
    turretMove = false;
    sound1.unmute();
    superSerial.write(1);
  }
}


void captureEvent(Capture c) {
  c.read();
}
