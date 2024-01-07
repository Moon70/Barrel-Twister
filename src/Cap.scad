include <Dimensions.scad>
include <ClickringBase.scad>


createCapModel();


module createCapModel(){
    difference()
    {
        union()
        {
            translate([0,0,-capBaseHeight/2])
            cylinder(h=capBaseHeight,d=shaftBaseDiameter,center=true);

            color("green")
            translate([0,0,capNotchHeight/2])
            difference()
            {
                cylinder(h=capNotchHeight,d=clickRingOuterDiameter-2.5,center=true);

                cylinder(h=capNotchHeight+overlap,d=clickRingInnerDiameter-4,center=true);
            }

            for(a=[0:120:359]){
                translate([0,0,capNotchHeight/2])
                rotate([0,0,a+30])
                translate([12,0,0])
                cylinder(h=capNotchHeight,d=6,center=true);

            }
        }        

        union()
        {
            color("gray")
            resize([clickRingOuterDiameter-0.6,clickRingOuterDiameter-0.6,capNotchHeight+overlap])
            translate([0,0,capNotchHeight/2])
            createRingModel2();

            color("blue")
            resize([clickRingOuterDiameter+0.3,clickRingOuterDiameter+0.3,capNotchHeight+overlap])
            translate([0,0,capNotchHeight/2])
            createRingModel2();


            for(a=[0:120:359]){
                translate([0,0,1/2])
                rotate([0,0,a+30])
                translate([12,0,0])
                cylinder(h=10,d=screwHoleOuterDiameter,center=true);
            }
        }
    }
}

module createRingModel2(){
    intersection()
    {
        difference()
        {
            union(){
                createClickRingBase(delta=0,height=capNotchHeight);
                for(a=[0:60:359]){
                    rotate([0,0,a])
                    translate([-clickRingOuterDiameter/2-notchDeltaX,0,0])
                    cylinder(h=capNotchHeight,d=notchRadius+clickRingThickness*2,center=true);
                }
            }

            union(){
                for(a=[0:60:359]){
                    rotate([0,0,a])
                    translate([-clickRingOuterDiameter/2-notchDeltaX,0,0])
                    cylinder(h=capNotchHeight+overlap,d=notchRadius,center=true);
                }
            }
        }

        cylinder(h=capNotchHeight,d=clickRingOuterDiameter,center=true);
    }
}
