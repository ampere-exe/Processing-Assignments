//Welcome to my snowman project. 
//To start the program, press either the right or left mouse button to change the environment of the snowman.
//Once in winter mode, press the 'e' key to start some new dialogue and q to remove dialogue (from either the summer and winter environments).
//Change the variables of the sunSize and shineFactor to change the size of the sun and shineFactor of the sun.
//change the numParticles variable to increase or decrease # of particles for the pipe smoke.
//

int backgroundColor = color(35, 206, 235);
float pipeX = 923;
float pipeY = 271;
int numParticles = 65; // Number of particles
float[] smokeX = new float[numParticles];
float[] smokeY = new float[numParticles]; // Declare arrays for smoke positions
int smokeIndex = 0; // Index to keep track of the next available particle position
boolean winterElement = false;
boolean sunActive = true;//Flag to track whether belt is active or not
boolean displayText1 = true;
boolean displayText2 = true;
float sunSize = 150; // Initial size of the sun
float shineFactor = 0.2; // Factor to control sun shine/sun shine speed
float cloudX = 0;
float cloudX1 = 450;
float cloudY = 50;
float cloudY1 = 120; 
float x1 = 912;  // Starting x-coordinate of the line
float y1 = 348;  // Starting y-coordinate of the line
float x2 = 810;  // Ending x-coordinate of the line
float y2 = 337;  // Ending y-coordinate of the line
float angle = 0; // starting value of angle
float angleIncrement = radians(1.5); // Increment for angle
boolean armDirection = true; // True for increasing angle, false for decreasing angle
String[] messages = {
    "Hello Mr. Karas! \nPress 'e' to continue",
    "My name is John Frost XIII",
    "I can't believe it's winter! \nDon't you just love \nchristmas?",
    "How do you like my project \nso far?",
    "I hope you like it, but\nfor now you can check \nout the rest of it",
    "Have a great day!",
    "Oh yeah, you can close \nthis by pressing 'q'"
};
int currentMessageIndex = 0; // Index to track the current message



void setup() {
    size(1280, 720);  // Set the size of the window
    smooth();
    textSize(24);
}

void draw() {
    background(backgroundColor); //sets value of background color
    
    //Snowman Body
    fill(255); // Makes snowman white
    stroke(0); //Makes outline black
    strokeWeight(0.1); //Makes outline thin
    ellipse(1000, 530, 240, 240); //lower ellipse
    noStroke(); // Removes outline for top 2 ellipses
    ellipse(1000, 380, 190, 190); //middle ellipse
    ellipse(1000, 240, 160, 160); //upper ellipse
    
    //Button Nose
    stroke(0); //makes black outline
    strokeWeight(1); //defines outline width
    fill(150, 75, 0); //makes button nose brown
    ellipse(1000, 245, 20, 20); //button nose
    fill(0); //makes button holes black
    ellipse(996, 242, 2, 2); //top left button hole
    ellipse(1004, 242, 2, 2); // top right button hole
    ellipse(1000, 247, 2, 2); //botton button hole
    
    //Eyes
    fill(0); // Makes eyes black
    ellipse(965, 213, 15, 15); // left eye
    ellipse(1035, 213, 15, 15); // right eye
    
    //Corncob Pipe
    fill(92, 64, 51); //makes pipe brown
    quad(990, 271, 1001, 278, 931, 288, 927, 285); //sets shape of pipe
    fill(255, 243, 128); // makes exitpiece yellow
    arc(924, 280, 30, 40, radians(0), radians(180)); // sets shape of exitpiece
    line(910, 280, 937, 280); //makes a chord forming with the arc
    
    //Body buttons
    fill(255, 255, 0);
    ellipse(1000, 344, 12, 12); // button 1
    ellipse(1000, 374, 12, 12); // button 2
    ellipse(1000, 404, 12, 12); // button 3
    
    //Simulate smoke
    frameRate(30);
    noStroke();
    fill(200, 200, 150, 70); // Semi-transparent light gray for smoke
    
    //Update and display all particles
    for (int i = 0; i < numParticles; i++) {
        ellipse(smokeX[i], smokeY[i], random(17, 30), random(15, 30));
        
        // Move the particles upwards
        smokeY[i] -= 1;
        
        // Reset the particles when they go off-screen and add new ones at the bottom
        if (smokeY[i] < 0) {
            smokeX[i] = random(pipeX - 10, pipeX + 10); // Randomize X position
            smokeY[i] = pipeY - random(0, 50); // Reset Y position with some randomness
        }
    }
    
    //Add new smoke particle at the bottom
    smokeX[smokeIndex] = random(pipeX - 10, pipeX + 10);
    smokeY[smokeIndex] = pipeY;
    smokeIndex = (smokeIndex + 1) % numParticles; // Cycle through the particle array
    
    
    //Draw sun when active
    if (sunActive) {
        fill(253, 184, 19); //Yellow color for the sun
        
        float shineSize = sunSize + sin(frameCount * shineFactor) * 10;
        ellipse(100, 100, shineSize, shineSize); // Draw a sun that changes size
    }
    
    //Draw cloud
    noStroke();
    fill(255); // White color for the cloud
    
    //Cloud 1
    ellipse(cloudX, cloudY, 120, 100); // Cloud shape
    ellipse(cloudX + 40, cloudY, 120, 100);
    ellipse(cloudX + 70, cloudY, 120, 100);
    ellipse(cloudX + 90, cloudY, 100, 70);
    
    //Cloud 2
    ellipse(cloudX1, cloudY1, 120, 100);
    ellipse(cloudX1 + 40, cloudY1, 120, 100);
    ellipse(cloudX1 + 70, cloudY1, 120, 100);
    ellipse(cloudX1 + 90, cloudY1, 100, 70);
    
    //Move the clouds to the right, sets speed of clouds
    cloudX += 1.5;
    cloudX1 += 1.5;
    
    //Reset the cloud's position when it goes off-screen
    if (cloudX > width + 100) {
        cloudX =-  60;
    }
    
    if (cloudX1 > width + 100) {
        cloudX1 = -120;
    }
    
    //Dialogue Text
    if (displayText1) {
        stroke(0);
        strokeWeight(1.5);
        rect(584, 154, 300, 115, 10);
        fill(0);
        text(messages[currentMessageIndex], 600, 193); // Display the current message
        fill(255);
        triangle(884, 252, 868, 269, 902, 280);
        noStroke();
        fill(255);
        rect(864, 252, 20, 16.5);
    }
    
    if (winterElement) {
        //Snowy Floor
        fill(255);
        noStroke();
        rect(0, 620, 1280, 100); // Snowy floor
        
        //hat
        fill(0);
        rect(928, 160, 140, 20);
        fill(90);
        rect(960, 110, 80, 50);
        fill(150, 75, 0);
        rect(155, 460, 65, 160);
        
        
        //christmas Tree
        fill(32,98, 20);
        triangle(29, 460, 346, 460, 188, 320);
        triangle(29, 460 - 70, 346, 460 - 70, 188, 320 - 70);
        triangle(29, 460 - 140, 346, 460 - 140, 188, 320 - 140);
        triangle(29, 460 - 210, 346, 460 - 210, 188, 320 - 210);
        
        // christmas tree lines
        stroke(0);
        strokeWeight(5);
        line(268, 182, 110, 250);
        line(79,276, 267, 321);
        line(299, 351, 99, 400);
        
        //lightsfor christmas tree
        strokeWeight(0);
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(152, 232, 10, 10);
        
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(218, 204, 10, 10);
        
        
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(177, 301, 10, 10);
        
        
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(145, 391, 10, 10);
        
        
        
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(152, 232, 10, 10);
        
        
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(93, 280,10, 10);
        
        
        fill(random(55, 255), random(55, 255), random(55, 255));
        ellipse(262, 359, 10, 10);
        
        
        
        //christmas star
        fill(255, 255, 0);
        noStroke();
        translate(189, 100);
        beginShape();
        vertex(0, -50);
        vertex(14, -20);
        vertex(47, -15);
        vertex(23, 7);
        vertex(29, 40);
        vertex(0, 25);
        vertex( -29, 40);
        vertex( -23, 7);
        vertex( -47, -15);
        vertex( -14, -20);
        endShape(CLOSE);
        translate( -189, -100);
        
        //belt
        strokeWeight(1);
        fill(0);//black
        quad(924, 438, 903, 459, 1100, 459, 1076, 438); //black belt
        fill(255, 215, 0); //gold
        stroke(0);
        rect(972, 438, 60, 21); // golden buckle
        fill(0);//black
        rect(978, 443, 47, 10); //interior belt
        
        //smile for winter
        fill(0);
        arc(1000, 268, 60, 30, radians(0), radians(180));
        
        //initialize theendpoints of the waving arm
        float endpointX = x1 + cos(angle) * (x2 - x1) - sin(angle) * (y2 - y1); 
        float endpointY = y1 + sin(angle) * (x2 - x1) + cos(angle) * (y2 - y1); 
        
        //Waving arm
        stroke(150, 75, 0); //brown
        strokeWeight(6);//arm thickness
        line(x1, y1, endpointX, endpointY); //left arm
        line(1086,348, 1150, 422); // right arm
        
        // Controlthe arm's motion
        if (armDirection) {
            angle += angleIncrement;
        } else{
            angle -= angleIncrement;
        }
        
        // Changearm direction when it reaches a certain angle
        if (angle > radians(50) || angle < radians(0)) {
            armDirection = !armDirection;
        }
        
    } else {
        
        // Grassy floor
        fill(0,154,23);
        noStroke();
        rect(0, 620, 1280, 100); 
        
        //frown for summer
        fill(0);
        arc(1000, 282, 60, 30, radians(180), radians(360));
        
        //summer arms
        stroke(150, 75, 0);
        strokeWeight(6);
        line(912, 348, 838, 422);
        line(1086, 348, 1150, 422);
        
        
        //Dialogue for summer
        if (displayText2) {
            stroke(0);
            strokeWeight(1.5);
            fill(255);
            rect(584, 154, 300, 115, 10);
            fill(0);
            text("I hate summer. It's too hot!", 600, 193); // Display the current message
            fill(255);
            triangle(884, 252, 868, 269,902, 280);
            noStroke();
            fill(255);
            rect(864, 252, 20, 16.5);
        } 
        
    }
}




void mousePressed() {
    if (mouseButton == LEFT) {
        backgroundColor = color(35, 206, 235); // Sets background to blue when left mouse button is pressed
        sunActive = true;
        winterElement = false;
        displayText1 = false;
    } else if (mouseButton == RIGHT) { 
        backgroundColor = color(205); // Sets background to black when right mouse button is pressed
        sunActive = false;
        winterElement = true;
        displayText2 = true;
    }
}

void keyPressed() {
    if (winterElement == true) {
        displayText1 = true;
        currentMessageIndex = (currentMessageIndex + 1) % messages.length; // Cycle through messages
    } else if (key == 'q') {
        displayText1 = false;
        displayText2 = false;
    }
    if (key == 'e') {
        displayText1 = true;
        displayText2 = true;
    }
    
}

//used to identify x and y coordinates upon mouse press
void mouseClicked() {
    // Print the coordinates to the console
    println("Mouse clicked at x : " + mouseX + ", y : " + mouseY);
}