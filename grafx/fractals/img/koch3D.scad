

translate([0,-200,0]) koch2D(100,1,1);
translate([120,-200,0]) koch2D(100,1,2);
translate([0,-250,0]) koch2D(100,1,3);
translate([120,-250,0]) koch2D(100,1,4);
translate([0,-300,0]) koch2D(100,1,5);
translate([120,-300,0]) koch2D(100,1,6);
translate([0,-350,0]) koch2D(100,1,7);
translate([120,-350,0]) koch2D(100,1,8);

translate([-360,0,0]) koch3D(100,1,1);
translate([-240,0,0]) koch3D(100,1,2);
translate([-360,-120,0]) koch3D(100,1,3);
translate([-240,-120,0]) koch3D(100,1,4);
koch3D(100,1,6);

translate([200,0,0]) rotate([0,0,180]) koch3D_structure(100,1,1);
translate([320,0,0]) rotate([0,0,180]) koch3D_structure(100,1,2);

// koch 3D fractal
module koch3D(ww,nn,mm) {
  if (nn<mm) {
    rotate([0,0,120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D(ww*2/3,nn+1,mm);
    rotate([0,0,-120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D(ww*2/3,nn+1,mm);
    rotate([0,0,0])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D(ww*2/3,nn+1,mm);
    
  } else {
    tetrion(ww);
  }
}

// double pyramid
module tetrion(ww) {
  pp = [[-ww/2,-ww/(2*sqrt(3)),0],
        [ww/2,-ww/(2*sqrt(3)),0],
        [0,ww*(sqrt(3)/2 - 1/(2*sqrt(3))),0],
        [0,0,ww/3],
        [0,0,-ww/3]];
  ff = [[3,1,0],
        [3,2,1],
        [3,0,2],
        [0,1,4],
        [1,2,4],
        [2,0,4]];
  polyhedron(pp,ff);
}


// koch 3D fractal structure
module koch3D_structure(ww,nn,mm) {
  if (nn<mm) {
    rotate([0,0,120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D_structure(ww*2/3,nn+1,mm);
    rotate([0,0,-120])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D_structure(ww*2/3,nn+1,mm);
    rotate([0,0,0])
      rotate([0,90,0])
        translate([0,ww/(2*sqrt(3)*3/2),0])
          koch3D_structure(ww*2/3,nn+1,mm);
    
  } else {
    tetrion_structure(ww);
  }
}

// double pyramid structure
module tetrion_structure(ww) {
  pp = [[-ww/2,-ww/(2*sqrt(3)),0],
        [ww/2,-ww/(2*sqrt(3)),0],
        [0,ww*(sqrt(3)/2 - 1/(2*sqrt(3))),0],
        [0,0,ww/30],
        [0,0,-ww/30]];
  ff = [[3,1,0],
        [3,2,1],
        [3,0,2],
        [0,1,4],
        [1,2,4],
        [2,0,4]];
  polyhedron(pp,ff);
  translate([0,0,-ww/3]) cylinder(d=ww/30,h=2*ww/3);
}


// koch 2D fractal
module koch2D(ww,nn,mm) {
  if (nn<mm) {
    translate([((ww/sqrt(3))*(sqrt(3)/2-1/sqrt(3))),0,0])
      rotate([0,0,150])
        translate([0,-ww/(3*2),0])
          koch2D(ww/sqrt(3),nn+1,mm);
    translate([-((ww/sqrt(3))*(sqrt(3)/2-1/sqrt(3))),0,0])
      rotate([0,0,-150])
        translate([0,-ww/(3*2),0])
          koch2D(ww/sqrt(3),nn+1,mm);
  } else {
    tria(ww);
  }
}

// triangle
module tria(ww) {
  pp = [[-ww/2,0],[ww/2,0],[0,ww/(2*sqrt(3))]];
  polygon(pp);
}
