$fn=50;
overlap=0.006;

clickringHeight=4.5;
clickringDiameter=40;
clickringThickness=2;

notchDiameter=50;
notchHeight=0.7;

deltaRinsize=2;

module ring(height=clickringHeight,delta=0){
    difference()
    {
        cylinder(h=height+delta-deltaRinsize,d=clickringDiameter+delta,center=true);
        cylinder(h=height+1-delta-deltaRinsize,d=clickringDiameter-clickringThickness*2-delta,center=true);
    }
}
