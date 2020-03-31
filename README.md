# Phase-Modulated Optimization

The PM optimization toolbox consists of solutions to find optimal phase space trajectories. The simple_opt package lets the user optimize the path and place constraints on the area (power), the average distance (heating) and the symmetry (robustness). 

## Background

The trajectory of the motional mode in phase space during a MS gate is the underlying mechanism behind entanglement. In the simplest scheme, the motional mode follows a circular path with a fixed area. Phase modulation enables one however to engineer arbitrary paths. The dynamics of the entangling gate, such as its speed, robustness and protection against heating heavily rely on which path is taken in phase space. The PM Optimization tools therefore let the user engineer optimal phase space trajectories. 

## simple_opt

The simple optimization package is a toolbox to explore various optimized paths with different constraints. The path is encoded by a series of angles \theta, which describe the angles of successive vectors making up the path. The length of the vectors is chosen so that the overall length of the path is the same as the perimeter of a circle with radius R = 0.5. The optimization function is called as follows :

```
optimizePathFMC(nSegments, endPositionTolerance, symmetryTolerance, averageDistanceTolerance)
```
 
* nSegments : Number of segments making up the path.
Note that the optimization algorithm optimizes half of the overall path for runtime reasons. Therefore, the actual number of segments in the final path will be 2 x nSegments.

* endPositionTolerance : Tolerance on the final position in x. The path should indeed finish at x = 0. 

* symmetryTolerance : Tolerance on the sum of y positions. Full symmetry around (0,0) means that Sum(y) = 0.

* averageDistanceTolerance : Tolerance on the average distance of the path from (0,0).

### Example 1

We run the optimization with tolerances on symmetry and average distance sufficiently high that they are ignored. 
```
optimizePathFMC(10, 1e-4, 1, 1)
```
This will simply find the path with the largest area. Running the code will give us a circle, as expected. 


