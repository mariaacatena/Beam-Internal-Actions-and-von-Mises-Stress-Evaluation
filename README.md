# Beam Internal Actions and von Mises Stress Evaluation
Project developed for the Mechanics of Machines 2 exam - Automation Engineering

## Overview
This project computes the support reactions, internal actions, and equivalent von Mises stress along a prismatic beam subjected to an arbitrary set of external forces, bending couples and torsional couples.

## Objective
-	Allow the user to define any number of bending and torsional couples.
-	Compute reaction forces and moments at the fixed support.
-	Compute internal actions along the beam.
-	Compute normal, shear, bending, and torsional stresses.
-	Compute equivalent von Mises stress using the Huber–von Mises criterion

## Methodology
- Definition of external forces and applied couples
- Calculation of reaction forces and moments
- Construction and sorting of the load matrix
- Evaluation of internal actions using the method of sections
- Computation of stress components along the beam
- Evaluation of equivalent von Mises stress

## Images
### 1. Internal actions diagram
<img width="1534" height="988" alt="image" src="https://github.com/user-attachments/assets/ed4c4aab-b929-42da-9960-c3cf9c778b1a" />

### 2. Equivalent von Mises stress distribution
<img width="1540" height="1004" alt="image" src="https://github.com/user-attachments/assets/65f32c34-8bf9-451c-88f3-7411e083930a" />

<img width="1660" height="1034" alt="image" src="https://github.com/user-attachments/assets/d0c8ecc7-2b16-4c34-8130-6128c50813b9" />

<img width="1562" height="986" alt="image" src="https://github.com/user-attachments/assets/ba027e2b-eb1c-4127-96d6-80512682333a" />


## How to run the project
-	Clone the repository 
-	Open MATLAB 
-	run('src/main.m')

## Requirements
MATLAB (no additional toolboxes required)
