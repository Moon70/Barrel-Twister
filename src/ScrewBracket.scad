include <Dimensions.scad>
include <ClickringBase.scad>

screwHoleLength=16.5-coverRingBaseHeight-capNotchHeight;
screwHoleBracketDiameter=5;
screwHoleSupport=6;

createScrewBracket();

module createScrewBracket(){
    difference()
    {
        hull()
        {
            sectorAngle=15;

            translate([0,0,-(screwHoleLength+screwHoleSupport)/2])
            rotate([0,0,-sectorAngle/2])
            intersection()
            {
                createClickRingBase(0,screwHoleLength+screwHoleSupport);

                rotate_extrude(angle=sectorAngle, convexity=2)
                translate([15,0,0])
                square(30,true);
            }

            translate([12,0,-screwHoleLength/2])
            cylinder(h=screwHoleLength,d=screwHoleBracketDiameter,center=true);
        }

        translate([12,0,-screwHoleLength/2])
        cylinder(h=screwHoleLength+overlap,d=screwHoleInnerDiameter,center=true);
    }
}

