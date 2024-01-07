include <Dimensions.scad>
include <ClickringBase.scad>
use <Tile.scad>

clickRingNotchDeltaX=-0.1;
clickRingZSpace=0.4;


createRingModel();


module createRingModel(){
    cutRingZSpace(){
        createMainRingWithNotches();
        createClickRing();
    }
}

module cutRingZSpace(){
    difference()
    {
        children();

        translate([0,0,ringHeight-clickRingZSpace])
        cylinder(h=ringHeight,d=ringInnerDiameter+2,center=true);
    }
}

module createMainRingWithNotches(){
    //ring with notches for the tiles
    difference()
    {
        cylinder(h=ringHeight,d=ringOuterDiameter,center=true);

        union()
        {
            cylinder(h=ringHeight+2,d=ringInnerDiameter,center=true);

            for(i=[0:60:359]){
                rotate([0,0,i])
                color("red")
                translate([0,ringOuterDiameter/2-getTileY()/2,0])
                tile(0.3);
            }
        }
    }
}

module createClickRing(){
    union(){
        color("green")
        addRingConnectors(){
            cutNotchFromNotchring(){
                createNotchRing(1.70);
            };
        }
        createSpring();
    }
}

module createSpring(){
    sectorAngle=120;
    sectorAngleDelta=9-14;

    intersection()
    {
        union()
        {
            difference()
            {
                cylinder(h=ringHeight,d=ringSpringDiameter1,center=true);

                cylinder(h=ringHeight+overlap,d=ringSpringDiameter1-springThickness ,center=true);
            }

            difference()
            {
                cylinder(h=ringHeight,d=ringSpringDiameter2,center=true);

                cylinder(h=ringHeight+overlap,d=ringSpringDiameter2-springThickness ,center=true);
            }
        }

        rotate([0,0,sectorAngle+sectorAngleDelta])
        rotate_extrude(angle = sectorAngle-sectorAngleDelta*2, convexity = 2)
        translate([15,0,0])
        square(30,true);
    }

    cubeLeftRightY=springThickness/2+(ringSpringDiameter1-ringSpringDiameter2)/2;
    rotate([0,0,30+sectorAngleDelta])
    translate([0,ringSpringDiameter1/2-cubeLeftRightY/2,0])
    cube([1,cubeLeftRightY,ringHeight],center=true);

    rotate([0,0,30+120-sectorAngleDelta])
    translate([0,ringSpringDiameter1/2-cubeLeftRightY/2,0])
    cube([1,cubeLeftRightY,ringHeight],center=true);


    bracketTopBotX=2;
    cubeTopY=(ringInnerDiameter-ringSpringDiameter1)/2+1;
    rotate([0,0,30+60])
    translate([0,ringSpringDiameter1/2+(ringInnerDiameter-ringSpringDiameter1)/4,0])
    cube([bracketTopBotX,cubeTopY,ringHeight],center=true);

    cubeBotY=(ringSpringDiameter2-springThickness-clickRingOuterDiameter)/2;
    rotate([0,0,30+60])
    translate([0,clickRingOuterDiameter/2+(ringSpringDiameter2-clickRingOuterDiameter)/4,0])
    cube([bracketTopBotX,cubeBotY,ringHeight],center=true);


    roundingRadius=1;
    color("blue")
    translate([roundingRadius/2+springThickness-ringSpringDiameter2/2-0.8,roundingRadius/2+bracketTopBotX/2,0])
    rotate([0,0,180])
    createRounding(radius=roundingRadius,height=ringHeight);

    color("blue")
    translate([roundingRadius/2+springThickness-ringSpringDiameter2/2-0.8,-roundingRadius/2-bracketTopBotX/2,0])
    rotate([0,0,90])
    createRounding(radius=roundingRadius,height=ringHeight);

    color("blue")
    translate([roundingRadius/2+springThickness-ringSpringDiameter1/2-2.4,-roundingRadius/2-bracketTopBotX/2,0])
    rotate([0,0,0])
    createRounding(radius=roundingRadius,height=ringHeight);

    color("blue")
    translate([roundingRadius/2+springThickness-ringSpringDiameter1/2-2.4,roundingRadius/2+bracketTopBotX/2,0])
    rotate([0,0,-90])
    createRounding(radius=roundingRadius,height=ringHeight);

}

module addRingConnectors(){
    children();

    cubeZ=(ringInnerDiameter-clickRingOuterDiameter)/2;
    for(a=[-105:105:105]){
        rotate([a,90,0])
        translate([0,0,ringInnerDiameter/2-cubeZ/2+1])
        cube([ringHeight,3,cubeZ],center=true);
    }

}
module cutNotchFromNotchring(){
    difference()
    {
        children();

        union(){
            rotate([0,0,springAngle])
            translate([-clickRingOuterDiameter/2,0,0])
            cube([5,0.5,ringHeight+overlap],center=true);

            rotate([0,0,-springAngle])
            translate([-clickRingOuterDiameter/2,0,0])
            cube([5,0.5,ringHeight+overlap],center=true);
        }
    }
}

module createNotchRing(delta=0){
    intersection()
    {
        union(){
            {
                createClickRingBase(delta);
                translate([-clickRingOuterDiameter/2-clickRingNotchDeltaX-delta,0,0])
                cylinder(h=ringHeight,d=notchRadius,center=true);
            }
        }
        cylinder(h=ringHeight,d=clickRingOuterDiameter+delta*2,center=true);
    }
}

module createRounding(radius,height){
    difference()
    {
        cube([radius,radius,height],center=true);

        translate([-radius/2,-radius/2,0])
        cylinder(h=height+overlap,r=radius,center=true);
    }
}
