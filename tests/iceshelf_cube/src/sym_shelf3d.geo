// In xy-plane, z unused
// Define km
km=1000.0;

//aspect=1000.0;
aspect=1.0;
// Ice shelf front depth
iceshelffrontdepth=0.2*km;
// Ice shelf depth below front (draft + additional depth below max draft)
oceandepthminusfront=0.9*km;
// Shelf length
shelflength=0.55*km * aspect;
// Open ocean length
oceanlength=0.55*km * aspect;
//oceanwidth
oceanwidth= shelflength+oceanlength;

// Southern boundary
Point(1) = {0,0.5*oceanwidth,0};
Extrude {0,0, oceandepthminusfront} {
Point{1}; Layers{9};
}
// Extrude north in latitude
//Line(1) = {1,2};
Extrude {shelflength,0,0} {
Line{1}; Layers{5};
}
// Extrude north in latitude again
//Line(2) = {3,4};
//Line(3) = {1,2};
//Line(4) = {2,3};
Extrude {oceanlength,0,0} {
Line{2}; Layers{5};
}
// Extrude up vertically, creating ice shelf front
//Line(6) = {5,6};
//Line(7) = {3,5};
//Line(8) = {4,6};
Extrude {0,0, iceshelffrontdepth} {
Line{8}; Layers{2};
}
//Line(10) = {4,7};
//Line(11) = {6,8};
//Line(12) = {7,8};

//for 3D
/*Extrude {0,oceanwidth,0} {*/
/*Surface{5,9,13}; Layers{10};*/
/*}*/
Extrude {0,0.5*oceanwidth,0} {
Surface{5,9,13}; Layers{5};
}

Extrude {0,-0.5*oceanwidth,0} {
Surface{5,9,13}; Layers{5};
}

/*Extrude {0,oceanwidth,0} {*/
/*Surface{9}; Layers{10};*/
/*}*/
/*Extrude {0,oceanwidth,0} {*/
/*Surface{13}; Layers{10};*/
/*}*/

// Boundaries
// Ocean free surface
Physical Surface(101) = {140,74};
// Bottom
Physical Surface(102) = {34,56,122,100};
// South
Physical Surface(103) = {22,88};
// North
Physical Surface(104) = {52,70,136,118};
// Ice front
Physical Surface(105) = {78,144};
// Ice slope
Physical Surface(106) = {26,92};
// East
Physical Surface(110) = {145,123,101};
// West
Physical Surface(120) = {35,57,79};

Physical Volume(49) = {1,2,3,4,5,6};
