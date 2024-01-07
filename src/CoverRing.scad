include <Dimensions.scad>

coverRingNotchDelta=0.2;
coverRingNotchHeight=2;


createCoverRingModel();


module createCoverRingModel(){
    difference()
    {
        translate([0,0,-coverRingBaseHeight/2])
        cylinder(h=coverRingBaseHeight,d=ringOuterDiameter,center=true);

        cylinder(h=ringHeight+overlap,d=clickRingInnerDiameter+1.9*2,center=true);
    }
    translate([0,0,coverRingNotchHeight/2-overlap])
    createSectorNotch(coverRingNotchDelta);
}

module createSectorNotch(coverRingNotchDelta=0){
    color("blue")
    difference()
    {
        intersection()
        {
            difference()
            {
                cylinder(h=coverRingNotchHeight,d=ringInnerDiameter-coverRingNotchDelta*2,center=true);
                cylinder(h=coverRingNotchHeight+overlap,d=clickRingOuterDiameter+coverRingNotchDelta*2+1.7*2,center=true);
            }

            sectorAngle=210;

            rotate([0,0,-105])
            rotate_extrude(angle = sectorAngle, convexity = 2)
            translate([15,0,0])
            square(20,true);
        }

        cubeZ=(ringInnerDiameter-clickRingOuterDiameter)/2;
        union()
        {
            for(a=[-105:105:105]){
                color("red")
                rotate([a,90,0])
                translate([0,0,ringInnerDiameter/2-cubeZ/2+1])
                cube([ringHeight,3+coverRingNotchDelta*3,15],center=true);
            }
        }
    }
}
