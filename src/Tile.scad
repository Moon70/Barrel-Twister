include <Dimensions.scad>

overlap=0.006;
$fn=50;

frontX=14;
frontY=1.4;
frontZ=10;
middleX=7;
middleY=1.7+0.2;
backX=12+2;
backY=1;
middleAndBackZ=9.0;

gripX=frontX;

gripHeight=1;

tileY=frontY+middleY+backY;

tile();

function getTileX()=frontX;
function getTileY()=tileY;

module tileWithGrip(){
    rotate([0,90,0])
    {
        difference()
        {
            tile();
        
            union()
            {
                translate([0,-5+middleY/2,-5-middleAndBackZ/2])
                cube([frontX+overlap,10,10],center=true);
                translate([0,-5+middleY/2,5+middleAndBackZ/2])
                cube([frontX+overlap,10,10],center=true);
            }
        }
        
        for(x=[-4:2:4]){
            color("green")
            translate([0,gripHeight/2,x])
            grip();
        }
    }
}

module tile(delta=0){
    translate([0,tileY/2,0])
    rotate([0,0,180])
    linear_extrude(height=frontZ, center=true, convexity=10, twist=0)
    polygon(points=[
        [-frontX/2/7*7-delta,-delta+calcDeltaH(frontX/2/7*7)],
        [-frontX/2/7*6-delta,-delta+calcDeltaH(frontX/2/7*6)],
        [-frontX/2/7*5-delta,-delta+calcDeltaH(frontX/2/7*5)],
        [-frontX/2/7*4-delta,-delta+calcDeltaH(frontX/2/7*4)],
        [-frontX/2/7*3-delta,-delta+calcDeltaH(frontX/2/7*3)],
        [-frontX/2/7*2-delta,-delta+calcDeltaH(frontX/2/7*2)],
        [-frontX/2/7*1-delta,-delta+calcDeltaH(frontX/2/7*1)],
        [0,0-delta],
        [frontX/2/7*1+delta,-delta+calcDeltaH(frontX/2/7*1)],
        [frontX/2/7*2+delta,-delta+calcDeltaH(frontX/2/7*2)],
        [frontX/2/7*3+delta,-delta+calcDeltaH(frontX/2/7*3)],
        [frontX/2/7*4+delta,-delta+calcDeltaH(frontX/2/7*4)],
        [frontX/2/7*5+delta,-delta+calcDeltaH(frontX/2/7*5)],
        [frontX/2/7*6+delta,-delta+calcDeltaH(frontX/2/7*6)],
        [frontX/2/7*7+delta,-delta+calcDeltaH(frontX/2/7*7)],
        [frontX/2+delta,delta],
        [frontX/2+delta,frontY+delta],
        [middleX/2+delta,frontY+delta],
        [middleX/2+delta,frontY-delta+middleY],
        [backX/2+delta,frontY+middleY-delta],
        [backX/2+delta,frontY+middleY+backY+delta],
        [-backX/2-delta,frontY+middleY+backY+delta],
        [-backX/2-delta,frontY+middleY-delta],
        [-middleX/2-delta,frontY+middleY-delta],
        [-middleX/2-delta,frontY+delta],
        [-frontX/2-delta,frontY+delta]]);
}

module grip(){
    translate([0,tileY/2,0])
    rotate([0,0,180])
    linear_extrude(height = gripHeight, center = true, convexity = 10, twist = 0)
    polygon(points=[
        [-gripX/2/7*7,calcDeltaH(gripX/2/7*7)],
        [-gripX/2/7*6,calcDeltaH(gripX/2/7*6)],
        [-gripX/2/7*5,calcDeltaH(gripX/2/7*5)],
        [-gripX/2/7*4,calcDeltaH(gripX/2/7*4)],
        [-gripX/2/7*3,calcDeltaH(gripX/2/7*3)],
        [-gripX/2/7*2,calcDeltaH(gripX/2/7*2)],
        [-gripX/2/7*1,calcDeltaH(gripX/2/7*1)],
        [0,0],
        [gripX/2/7*1,calcDeltaH(gripX/2/7*1)],
        [gripX/2/7*2,calcDeltaH(gripX/2/7*2)],
        [gripX/2/7*3,calcDeltaH(gripX/2/7*3)],
        [gripX/2/7*4,calcDeltaH(gripX/2/7*4)],
        [gripX/2/7*5,calcDeltaH(gripX/2/7*5)],
        [gripX/2/7*6,calcDeltaH(gripX/2/7*6)],
        [gripX/2/7*7,calcDeltaH(gripX/2/7*7)],
        [gripX/2,0],
        [gripX/2,frontY],
        [-gripX/2,frontY]]);
}

function calcDeltaH(x)=ringOuterDiameter/2-sqrt(pow(ringOuterDiameter/2,2)-pow(x,2));

