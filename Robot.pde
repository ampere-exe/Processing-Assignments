
/*
Full Name: Zuhair Emaz
Assignment Name: Robot 3 - Respojnse
Class: CS 10 - Block 10
Date Completed: Oct 13, 2023

This program is my own work - Digital Signature (ZE) 

References:
student: Bhabis Lamichanne 
*/

// Press r, o, b to toggle the color of the robots head to red, orange or black respectively.

float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.03; // Speed to which the robot moves to mouseX
color headColor = color(0); // Initialize headColor as black
boolean red = false; // sets red head color to false
boolean orange = false; // sets orange head color to false
boolean black = false;  // sets black head color to false

void setup() {
    size(1280, 720);
    smooth();
    strokeWeight(2);
    ellipseMode(RADIUS);
}

void draw() {
    int targetX = mouseX; // Fixed variable declaration
    x += (targetX - x) * easing;
    
    int targetY = mouseY; // Fixed variable declaration
    y += (targetY - y) * easing;
    
    if (mousePressed) {
        neckHeight = 16;
        bodyHeight = 90;
    } else {
        neckHeight = 70;
        bodyHeight = 160;
    }
    
    float ny = y - bodyHeight - neckHeight - radius;
    
    background(204);
    
    // Neck
    stroke(102);
    line(x + 12, y - bodyHeight, x + 12, ny);
    // Antennae
    line(x + 12, ny, x - 18, ny - 43);
    line(x + 12, ny, x + 42, ny - 99);
    line(x + 12, ny, x + 78, ny + 15);
    // Body
    noStroke();
    fill(102);
    ellipse(x, y - 33, 33, 33);
    fill(0);
    rect(x - 45, y - bodyHeight, 90, bodyHeight - 33);
    // Head
    fill(headColor);
    ellipse(x + 12, ny, radius, radius);
    fill(255);
    ellipse(x + 24, ny - 6, 14, 14);
    fill(0);
    ellipse(x + 24, ny - 6, 3, 3);
    
    if (red) {
        headColor = color(210, 0, 0);
    } 
    if (orange) {
        headColor = color(255, 165, 0); 
    } 
    if (black) {
        headColor = color(0);
    }
}

void keyPressed() {
    if (key == 'r') {
        red = !red; // Toggle the value of 'red'
        orange = false;
        black = false;
    } else if (key == 'o') {
        orange = !orange; // Toggle the value of 'orange'
        red = false;
        black = false;
    } else if (key == 'b') {
        black = !black; // Toggle the value of 'black'
        red = false;
        orange = false;
    }
}