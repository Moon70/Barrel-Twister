include <Dimensions.scad>
include <ClickringBase.scad>
use <ScrewBracket.scad>


createShaftModel();


module createShaftModel(){
    translate([0,0,shaftBaseHeight/2-shaftLength/2])
    cylinder(h=shaftBaseHeight,d=shaftBaseDiameter,center=true);

    color("blue")
    createRingModel();

    for(a=[0:120:359]){
        color("green")
        translate([0,0,shaftLength/2-capNotchHeight])
        rotate([0,0,a+30])
        createScrewBracket();
    }

}

module createRingModel(){
    intersection()
    {
        difference()
        {
            union(){
                createClickRingBase(delta=0,height=shaftLength);
                for(a=[0:60:359]){
                    rotate([0,0,a])
                    translate([-clickRingOuterDiameter/2-notchDeltaX,0,0])
                    cylinder(h=shaftLength,d=notchRadius+clickRingThickness*2,center=true);
                }
            }

            union(){
                for(a=[0:60:359]){
                    rotate([0,0,a])
                    translate([-clickRingOuterDiameter/2-notchDeltaX,0,0])
                    cylinder(h=shaftLength+overlap,d=notchRadius,center=true);
                }
            }
        }

        cylinder(h=shaftLength,d=clickRingOuterDiameter,center=true);
    }
}
