
// example of COLORED SIERPISNKI 3D
sierpinski3Dc(200,1,5,0,0,0);

// tridimensional recursive sierpinski function
module sierpinski3Dc(ww,nn,mm,rr,gg,bb) {
  // condition to propagate recursion
  if (nn<mm) {
    // single iteration of fractal transformation and recursion step
    translate([-ww/4,-ww/8,0])  sierpinski3Dc(ww/2,nn+1,mm,rr+1/pow(2,nn),gg,bb);
    translate([+ww/4,-ww/8,0])  sierpinski3Dc(ww/2,nn+1,mm,rr,gg+1/pow(2,nn),bb);
    translate([0,ww/4,0])       sierpinski3Dc(ww/2,nn+1,mm,rr,gg,bb+1/pow(2,nn));
    translate([0,0,ww/sqrt(6)]) sierpinski3Dc(ww/2,nn+1,mm,rr,gg,bb);
    translate([0,0,ww/sqrt(6)]) mirror([0,0,1]) sierpinski3Dc(ww/2,nn+1,mm,rr,gg,bb);
  }
  // end of recursion, draw basic shape
  else {
    color([rr,gg,bb]) tetra(ww);
  }
}


// example of SIERPISNKI 3D
translate([300,-500,0]) sierpinski3D(200,1,4);

// tridimensional recursive sierpinski function
module sierpinski3D(ww,nn,mm) {
  // condition to propagate recursion
  if (nn<mm) {
    // single iteration of fractal transformation and recursion step
    translate([-ww/4,-ww/8,0])  sierpinski3D(ww/2,nn+1,mm);
    translate([+ww/4,-ww/8,0])  sierpinski3D(ww/2,nn+1,mm);
    translate([0,ww/4,0])       sierpinski3D(ww/2,nn+1,mm);
    translate([0,0,ww/sqrt(6)]) sierpinski3D(ww/2,nn+1,mm);
    //color("Brown") translate([0,0,ww/sqrt(6)]) mirror([0,0,1]) tetrion(ww/2);
    translate([0,0,ww/sqrt(6)]) mirror([0,0,1]) sierpinski3D(ww/2,nn+1,mm);
  }
  // end of recursion, draw basic shape
  else {
    tetra(ww);
  }
}

module tetra(ww) {
  pp = [[-ww/2,-ww/4,0],
        [ww/2,-ww/4,0],
        [0,ww/2,0],
        [0,0,ww*sqrt(6)/3]];
  ff = [[0,1,2],
        [0,1,3],
        [1,2,3],
        [2,0,3]];
  polyhedron(pp,ff);
}


// example of SIERPISNKI 2D
translate([0,-500,0]) union() {
  translate([   0,0,0]) sierpinski2D(200,1,5);
  translate([-220,0,0]) sierpinski2D(200,1,4);
  translate([-440,0,0]) sierpinski2D(200,1,3);
  translate([-660,0,0]) sierpinski2D(200,1,2);
  translate([-880,0,0]) sierpinski2D(200,1,1);
}

// bidimensional recursive sierpinski function
module sierpinski2D(ww,nn,mm) {
  // condition to propagate recursion
  if (nn<mm) {
    // single iteration of fractal transformation and recursion step
    translate([-ww/4,-ww/8,0]) sierpinski2D(ww/2,nn+1,mm);
    translate([+ww/4,-ww/8,0]) sierpinski2D(ww/2,nn+1,mm);
    translate([0,ww/4,0])      sierpinski2D(ww/2,nn+1,mm);
  } 
  // end of recursion, draw basic shape
  else {
    tria(ww);
  }
}

// basic shape : triangle
module tria(ww) {
  pp = [[-ww/2,-ww/4],[ww/2,-ww/4],[0,ww/2]];
  polygon(pp);
}


// tretrahedron for 3d printing
module tetrion2(ww) {
  wi = ww*1.1;
  pp = [[-wi/2,-wi/4,0],[wi/2,-wi/4,0],[0,wi/2,0],[0,0,wi*sqrt(6)/3]];
  ff = [[0,2,1],[0,1,3],[1,2,3],[2,0,3]];
  polyhedron(pp,ff);
}