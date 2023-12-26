include <Dimensions.scad>
include <ClickRingBase.scad>
use <Tile.scad>
use <ClickRing1.scad>
use <ClickRing2.scad>

$fn=50;
overlap=0.006;

testX=14;
testY=10;
testZ=10;

delta=1;

createRingModel();

module createRingModel(){
    addAxeHole()
    {
        createSlider()
        {
            base();
        }
    }

    translate([0,0,-clickringHeight/2+ringHeight/2])
    rotate([0,0,-30])
    clickRing1();
}

module createSlider(){
    difference()
    {
        children();
        union()
        {
            for(i=[0:60:359]){
                echo(i);
                rotate([0,0,i])
                color("red")
                translate([0,30-testY/2,0])
                translate([0,(testY-getTileY())/2,0])
                tile(0.4);
            }
        }
    }
}

module base(){
    difference()
    {
        cylinder(h=ringHeight,d=ringOuterDiameter,center=true);
        cylinder(h=ringHeight+2,d=ringInnerDiameter,center=true);
    }
    for(i=[30:120:389]){
        rotate([90,0,i])
        translate([0,0.5,ringOuterDiameter/4])
        cube([6.5,2.5,ringOuterDiameter/2-1],center=true);
    }

    cubeS=15;
    cubeH=4.25;

    translate([0,0,cubeH/2])
    cylinder(h=10-cubeH,d=14,center=true);

    translate([0,0,cubeH/2-ringHeight/2-overlap/2])
    rotate([0,0,30])
    cylinder(h=cubeH+overlap,d=cubeS,center=true,$fn=6);

}

module addAxeHole(){
    difference()
    {
        children();

        cylinder(h=ringHeight+2,d=axeDiameter,center=true);
    }
}