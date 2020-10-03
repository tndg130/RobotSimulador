import processing.serial.*;
PShape base, shoulder, upArm, loArm, end;
float rotX, rotY;
float alpha, beta, gamma;
int[] numero;
Serial myPort; 
Serial myPort2; 
void setup(){
    size(600, 600, OPENGL);    
    base = loadShape("r1.obj");
    shoulder = loadShape("b1.obj");
    upArm = loadShape("b3.obj");
    loArm = loadShape("b4.obj");
myPort = new Serial(this, Serial.list()[1], 9600);
myPort2 = new Serial(this, Serial.list()[2], 9600);
}

void draw(){    
    while (myPort.available() > 0) {
   background(32);
   smooth();
   lights(); 
   directionalLight(51, 102, 126, -1, 0, 0); 
   noStroke();
   rotateX(-.229999);
   rotateY(6.25992);
   translate(width/2,height/2);
   scale(-5.5); 
     String numbers = myPort.readString();
    int[] nums = int(split(numbers," "));
    println(numbers);
    println(nums[0]);
    println(nums[1]);

   
    println(nums[2]);
       
       
        byte sal[] = new byte[3];
    sal[0] = byte(nums[0]);
    sal[1] = byte(-nums[1]);
    sal[2] = byte(180+nums[2]);
    myPort2.write(sal);
    
    
translate(0,-40,0);   
     shape(base);     
   translate(0, 4, 0);
   rotateY(radians(nums[0]));
     shape(shoulder);
      
   translate(0, 0, 7.5);
   rotateY(PI);
   rotateX(-radians(nums[1]));
     shape(upArm);      
   translate(0, -1, 35);
   rotateY(PI);
   rotateX(radians(180)+radians(nums[2]));
     shape(loArm);
    
    
}}



