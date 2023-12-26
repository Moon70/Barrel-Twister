include <Dimensions.scad>
use <Shaft.scad>

$fn=50;

createBaseModel();

module createBaseModel(){
    addScrewHole()
    {
        addShaft()
        {
            basePlateAndWall();
        }
    }
}


module basePlateAndWall(){
    difference()
    {
        cylinder(h=baseRingHeight,d=ringOuterDiameter,center=true);
        translate([0,0,basePlateThickness])
        cylinder(h=baseRingHeight-1,d=ringInnerDiameter,center=true);
    }
}

module addShaft(){
    children();

    translate([0,0,shaftLength/2-baseRingHeight/2])
    shaft();
}

module addScrewHole(){
    difference()
    {
        children();

        translate([0,0,-screwHoleLength/2-baseRingHeight/2+shaftLength+overlap])
        cylinder(h=screwHoleLength,d=screwHoleInnerDiameter,center=true);
    }
}
