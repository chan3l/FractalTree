private double fractionLength = .75; 
private int smallestBranch = 5; 
private double branchAngle = 0.5;  
private float c = 0.5;
public void setup() 
{   
  size(640, 480);    
  noLoop();
} 
public void draw() 
{   
  background(222);   
  for (int x =0; x<480; x++) {
    stroke(0+c, 90+c, 255);
    line(0, x, 640, x); 
    c=c+0.5;
  }
  stroke(255,216,75);   
  strokeWeight(1.5);
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 100, 3*Math.PI/2);
} 
public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  stroke(x, y, 50);
  double ang1 = angle + branchAngle;
  double ang2 = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  int endX1 = (int)(branchLength*Math.cos(ang1) +x);
  int endY1 = (int)(branchLength*Math.sin(ang1) +y);
  int endX2 = (int)(branchLength*Math.cos(ang2) +x);
  int endY2 = (int)(branchLength*Math.sin(ang2) +y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if (branchLength>smallestBranch) {
    drawBranches(endX1, endY1, branchLength, ang1);
    drawBranches(endX2, endY2, branchLength, ang2);
  } else {
    fill(x, y, 255);
    noStroke();
    ellipse(endX1, endY1, 2, 2);
    ellipse(endX2, endY2, 2, 2);
  }
}