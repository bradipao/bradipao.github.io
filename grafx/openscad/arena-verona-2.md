# Verona Arena
### 2 - Building the plan of the model

Once defined the procedure to build the outermost oval, it is trivial to add the inner ones, just reducing the radius of each arc of circle. But an anomaly immediately appears: add internal ovals drawing their perimeters at constant distance from external one causes a progressive flattening of the ovals. And this creates a problem for our procedural building: arches of the outermost ovals are of the same size because of our construction, but their projections on internal ovals presents a different size either on smaller or bigger arc of circle. There is no solution to this mismatch, this is also in the actual building, so we live with it and we stick with perfect match only on the outermost oval, the visibile one. The only impact on our procedural building is that, for inner ovals, we would need arches of slightly different size depending on the arc of circle they belong.

In order to proceed with the construction of inner ovals, my first approach is to print the plan and measure the distances between ovals with the ruler, then to apply a proportional reduction to RMAX and Rmin in order to obtain their value for each of the inner oval. The final result was acceptable but I tried another way: the work of Prof. Trevisan makes ofteb reference to the "roman foot" as the unit of measure used for the roman buildings and in fact most sizes of the Arena are whole multiples of a "roman foot", included the two inner and outer axis.

- Outermost oval
  - AMAX = 259 roman feet
  - Amin = 209 roman feet
- Innermost oval
  - AMAX = 125 roman feet
  - Amin = 75 roman feet

Then first (good) thing we note is that the distance between outermost and innermost ovals is constantly 134 roman feet, a necessary condition for building an amphitheatre with terraces of cnstant width and height. This approach seemed to fit very well for the procedural building, so I proceeded to determine the radius for the other inner ovals, hoping for a whole number of roman feet.

This is the list of ovals we need:
- Arena : innermost oval
- Wall-1 : 1st intermediate wall
- Circle-1 : 1st oval of columns
- Gallery-1 : 1st gallery
- Circle-2 : 2nd oval of columns
- Wall-2 : 2nd intermediate wall
- Circle-3 : 3rd oval of columns
- Gallery-2 : 2nd gallery
- Circle-4 : 4th oval of columns
- Wall-3 : 3rd intermediate wall
- Circle-5 : 5th oval of columns
- Gallery-3 : 3rd gallery
- Circle-6 : 6th oval of columns

Considering that the "roman feet" is about 0.2954 meters, the final sizes are the following (for significant values there is radius at the border and in the middle, in order to make procedural positioning easier):

|             | DELTA |             | AMAX  | border   | middle   | AMIN  | border   | middle | 
|-------------|-------|-------------|-------|----------|----------|-------|----------|--------|
|             | ft    | mt          | ft    | mt       | mt       | ft    | mt       | mt     | 
| arena       |       |             | 125   | 36.925   |          | 75    | 22.155   |        | 
| 1st wall    | 13    | 3.840       | 138   | 40.765   |          | 88    | 25.995   |        | 
| 1st circle  | 1     | 0.295       | 139   | 41.061   | 40.913   | 89    | 26.291   | 26.143 | 
| 1st gallery | 10    | 2.954       | 149   | 44.015   | 42.538   | 99    | 29.245   | 27.768 | 
| 2nd circle  | 1     | 0.295       | 150   | 44.310   | 44.162   | 100   | 29.540   | 29.392 | 
| 2nd wall    | 26    | 7.680       | 176   | 51.990   |          | 126   | 37.220   |        | 
| 3rd circle  | 1     | 0.295       | 177   | 52.286   | 52.138   | 127   | 37.516   | 37.368 | 
| 2nd gallery | 11    | 3.249       | 188   | 55.535   | 53.911   | 138   | 40.765   | 39.141 | 
| 4th circle  | 2     | 0.591       | 190   | 56.126   | 55.831   | 140   | 41.356   | 41.061 | 
| 3rd wall    | 43    | 12.702      | 233   | 68.828   |          | 183   | 54.058   |        | 
| 5th circle  | 4     | 1.182       | 237   | 70.010   | 69.419   | 187   | 55.240   | 54.649 | 
| 3rd gallery | 15    | 4.431       | 252   | 74.441   | 72.225   | 202   | 59.671   | 57.455 | 
| 6th circle  | 7     | 2.068       | 259   | 76.509   | 75.475   | 209   | 61.739   | 60.705 | 

It is worth noting that using whole numbers in "roman feet" for the intermediate sizes leads to final values slightly different from the ones available in the public domain, but I found them closer to the spirit of the builder, so I decided to use them.

As previously anticipated, the system of equations has been solved in order to have arches of the 3rd gallery equal in size, and results necessary to draw the for-centers-oval are the following:
- alpha = 59.4 °
- RMAX = 94.023 m
- Rmin = 54.113 m

The size of arches for arcs of circle of each ovals are calculated. Now it seems just a curiosity, but it will be fundamental in the procedural building of the model, because arches of each inner ovals need to be carefully sized. As expected, the arches of the outermost ovals are almost identical on the two arcs of circle (both with RMAX and Rmin), while the mismatch grows progressively going internally until the maximum mismatch on the innermost ovals (but here we do not have architectural geometries that could be aesthetically compromised).
 
|             | LMAX  | LMIN     | LMAX  | LMIN   |
|-------------|-------|----------|-------|--------|
|             | mt    | mt       | mt    | mt     |
| arena       | 3.552 | 1.811    |       |        |
| 1st wall    | 3.793 | 2.230    |       |        |
| 1st circle  | 3.812 | 2.262    | 3.803 | 2.246  |
| 1st gallery | 3.998 | 2.584    | 3.905 | 2.423  |
| 2nd circle  | 4.016 | 2.617    | 4.007 | 2.601  |
| 2nd wall    | 4.499 | 3.455    |       |        |
| 3rd circle  | 4.517 | 3.487    | 4.508 | 3.471  |
| 2nd gallery | 4.722 | 3.842    | 4.619 | 3.664  |
| 4th circle  | 4.759 | 3.906    | 4.740 | 3.874  |
| 3rd wall    | 5.557 | 5.292    |       |        |
| 5th circle  | 5.631 | 5.421    | 5.594 | 5.357  |
| 3rd gallery | 5.908 | 5.905    | 5.770 | 5.663  |
| 6th circle  | 6.039 | 6.130    | 5.974 | 6.018  |
|             | border|          | middle|        |


Now we have all the parameters necessary to draw the complete plan in openSCAD, iterating the same procedure seen in previous file, for each oval composed by four arcs of circle with radius RMAX and Rmin.

   // oval radius
   rmaxar = [56.535];                  // arena
   rmax1c = [60.375,60.523,60.671];    // column 1
   rmaxg1 = [62.148];                  // gallery 1
   rmax2c = [63.625,63.772,63.920];    // column 2
   rmax3c = [71.600,71.748,71.896];    // column 3
   rmaxg2 = [73.521];                  // gallery 2
   rmax4c = [75.145,75.441,75.736];    // column 4
   rmax5c = [88.438,89.029,89.620];    // column 5
   rmaxg3 = [91.835];                  // gallery 3
   rmax6c = [94.023,95.085,96.119];    // column 6
   rminar = [16.593];
   rmin1c = [20.433,20.581,20.728];
   rming1 = [22.205];
   rmin2c = [23.682,23.830,23.978];
   rmin3c = [31.658,31.806,31.954];
   rming2 = [33.578];
   rmin4c = [35.203,35.498,35.794];
   rmin5c = [48.496,49.087,49.678];
   rming3 = [51.893];
   rmin6c = [54.113,55.142,56.176];

   // arena oval parameters
   alfa = 59.4;
   beta = 90 - alfa;
   dx = (rmax6c[1]-rmin6c[1])*cos(alfa);
   dy = (rmax6c[1]-rmin6c[1])*sin(alfa);

![Verona Arena hall diagram](img-arena/arena_diagram_hall.png)






Prendendo il valore di mezzeria del sesto cerchio di colonne (RMAX6C[1] e RMIN6C[1]), disegno sui quattro archi di cerchio le colonne di dimensioni 2,1x2,3 metri (come da fonte wikipedia). Analogamente faccio per gli ovali interni esclusa l'arena, riducendo progressivamente la dimensione della colonna. Per l'arena e per gli ovali interni disegno anche i segmenti di arco di cerchio, avendo cura di tracciarli solo laddove presenti e lasciando vuoto il segmento che deve rimanere tale. Passando invece alla direzione radiale, traccio i muri dei setti laddove presenti.

Casi particolari sono i primi segmenti adiacenti all'asse maggiore dell'ovale, perché non hanno direzione radiale, ma sono paralleli tra di loro a partire dalle colonne del sesto cerchio, così da creare un ingresso a pianta rettangolare (quindi non triangolare) in direzione del centro dell'area.




Questo il risultato finale della pianta dell'Arena di Verona in openSCAD.



![Verona Arena diagram](img-arena/arena_diagram.png)




Collegamenti ai file sorgente

    foglio elettronico : pianta.xlsx
    pianta openSCAD : arena_diagram.scad


