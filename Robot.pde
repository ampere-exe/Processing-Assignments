//Press r to toggle the color of the robots head to red or black.
//WORK

float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.03; // Speed to which the robot moves to mouseX
color headColor = color(0); // Initialize headColor as black
boolean red = false;

void setup() {
    size(360, 480);
    smooth();
    strokeWeight(2);
    ellipseMode(RADIUS);
}

void draw() {
    int targetX = mouseX; // Fixed variable declaration
    x += (targetX - x) * easing;
    
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
    } else {
        headColor = color(0);
    }
}

void keyPressed() {
    if (key == 'r') {
        red = !red; // Toggle the value of 'red'
    }
}