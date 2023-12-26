include <Dimensions.scad>
include <ClickRingBase.scad>
use <Shaft.scad>
//use <..\tools\DevTools.scad>

overlap=0.006;
$fn=50;

createCapModel();

module createCapModel(){
    addScrewHole(){
        difference()
        {
            union(){
                basePlateAndRing();
                cylinder(h=capRingHeight,d=axeDiameter+2,center=true);
            }

            translate([0,0,shaftLength/2-capRingHeight/2+basePlateThickness+basePlateThickness])
            rotate([180,0,0])
            shaft(0.2);
        }
    }
}

module basePlateAndRing(){
    difference()
    {
        cylinder(h=capRingHeight,d=ringOuterDiameter,center=true);
        translate([0,0,basePlateThickness])
        cylinder(h=capRingHeight-1,d=ringInnerDiameter,center=true);
    }
}

module addScrewHole(){
    difference()
    {
        union(){
            children();
            translate([0,0,screwHoleStrengthener/2-capRingHeight/2+basePlateThickness])
            cylinder(h=screwHoleStrengthener,d=axeDiameter,center=true);
        }
        cylinder(h=screwHoleLength+10,d=screwHoleOuterDiameter,center=true);
    }
}
