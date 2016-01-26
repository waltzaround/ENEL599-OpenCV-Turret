/* 
Project: Physical Computing
By Walter Lim
Version 2 Turret

Searches for faces. if face detected, activates sentry gun noises

Contains modified code from Greg Borenstein under the OpenCV for Processing Project https://github.com/atduskgreg/opencv-processing

*/



import ddf.minim.*;// import Minim library
import gab.opencv.*;// import OpenCV library
import processing.video.*;// import processing video library
import java.awt.*;// import java awt library
import processing.serial.*;
import javax.swing.*;

Minim minim;// declare Minim to be the same as minim
Capture video;//declare Capture to be the same as video
OpenCV opencv;// declare OpenCV to be the same as opencv

Serial serial;


boolean motorstate = true;
boolean turretActive = false; // declare turretActive to be a boolean variable, currently set to false
AudioInput input; // declare audioinput as input
AudioPlayer sound1; // declare sound1 as an audiplayer

void setup() { // begin void setup

    //begin serial selection
  String[] ports = Serial.list();
  JComboBox cbxPortList = new JComboBox(ports); //ask user to select one
  JOptionPane.showMessageDialog(this, cbxPortList, "Select a Serial Communication Port", JOptionPane.PLAIN_MESSAGE);
  //initialize selected serial port
  String selectedPort = (String) cbxPortList.getSelectedItem();
  serial = new Serial (this, selectedPort, 9600);
  //end serial selection

  size(640, 480); // set size of sketch to be 640 x 480
  video = new Capture(this, 640/2, 480/2); // declare new video capture stream @ 320 x 240
  opencv = new OpenCV(this, 640/2, 480/2);// declare new OpenCV @ 320 x 240
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  //load more OpenCV code

  video.start();// start video capture

  minim = new Minim(this);// load new minim
  sound1 = minim.loadFile("fire.wav");// declare sound1 to play fire.wav file when called
  input = minim.getLineIn();// acquire line
  sound1.loop(); // loop fire.wav
}// end void setup

void draw() {  //begin void draw


    scale(2);// set scale x 2
  opencv.loadImage(video); // load current frame from 320 x 240 video stream
  image(video, 0, 0 );// load image from video beginning at 0,0
  noFill();// no fill
  stroke(0, 255, 0);// declare stroke
  strokeWeight(3);// declare stroke weight
  Rectangle[] faces = opencv.detect();// begin rectangle array and equate it to opencv detection
  println(faces.length); // declare how many faces are present
  if (faces.length >= 1) { // are 1 or more faces detected by OpenCV?
    turretActive = true;// unmute fire.wav sound
    //    println("is true");
    //
    //    sound1.unmute();
  }

  if (faces.length == 0) {// are there 0 faces detected by OpenCV?
    turretActive = false;// mute fire.wav sound
    //    println("is true");
    //
    //    sound1.unmute();
  }

  for (int i = 0; i < faces.length; i++) {  // for each face detected....
    println(faces[i].x + "," + faces[i].y);// print the location of each detected face to the console!
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);// draw a fancy green rectangle around each face!
  }

  if (turretActive = true) {// is boolean turretActive set to true?
    sound1.unmute();// if true, unmute the sound!
    motorState = false;// tell the motor to pause movement
  }
  if (turretActive = false) {// is boolean turretActive set to false?
    sound1.mute();// if false, mute the sound!
    motorState = true;// tell the motor to continue movement
  }
}


void captureEvent(Capture c) {
  c.read();
}


