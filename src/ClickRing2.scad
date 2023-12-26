include <Dimensions.scad>
include <ClickRingBase.scad>

clickRing2();

module clickRing2(){
    translate([0,0,deltaRinsize/2+1.50])
    createRing2();

    cubeS=15;
    cubeH=4.0;
    difference()
    {
        union(){
            translate([0,0,-cubeH/2+clickringHeight/2])
            cylinder(h=cubeH,d=cubeS+4,center=true,$fn=6);

            for(i=[30:120:389]){
                rotate([0,0,i])
                translate([clickringDiameter/4-clickringThickness/2,0,4/2-0.05])
                cube([clickringDiameter/2,7.0,0.6],center=true);
            }
        }

        union(){
            cylinder(h=clickringHeight+overlap,d=axeDiameter,center=true);

            translate([0,0,-cubeH/2+clickringHeight/2])
            cylinder(h=cubeH+overlap,d=cubeS+0.6,center=true,$fn=6);
        }
    }
}

module createRing2(){
    rotate([180,0,30])
    difference()
    {
        translate([0,0,-notchHeight])
        ring(clickringHeight+notchHeight,0);

        translate([0,0,-clickringHeight])
        ringWithNotch(0.2);
    }
}

module ringWithNotch(delta=0){
    translate([0,0,deltaRinsize/2+notchHeight])
    difference()
    {
        ring(clickringHeight,delta);

        translate([0,0,notchDiameter/2+clickringHeight/2-deltaRinsize/2-notchHeight])
        for(a=[0:60:179]){
            rotate([a+30,90,0])
            cylinder(h=60,d=notchDiameter,center=true);
        }
    }
}
