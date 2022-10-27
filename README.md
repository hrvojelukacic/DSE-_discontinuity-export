# DSE-_discontinuity-export
This MatLAB script exports discontinuity orientation (dip and dip direction) from the results of Discontinuty Set Extractor

INPUT FILE: 
  Please use txt file in the form of TTTTT js-c-abcd.txt which is exported after analysis in DSE is finished
  
PROCEDURE: 
  1. Importing normal vector components and storing them into seperate matrix 
  2. Calculating dip angle of the discontinuity plane (in regards to horizontal plane) using direction cosines nz of the normal vector 
  3. FOR loop which finds all normal vectors that are facing down and turns there orientation - All normals have to be oriented upward (positive nz component)
  4. Calculation of dip direction ( clockwise angle form the north direction ) - calculation is done by using direction cosines for 4 quardants
  5. Storing dip and dip direction vvalues into a seperate matrix 
  6. Exporting CSV file for further analysis
  
  NOTE: 
    In order for this code to work you must add it to path and be sure that your normal vectors are unit vector which means there length is 1. That can be checked by       calculating vector magnitude - sqrt(nx^2+ny^2+nz^2) = 1  - normal vectors exported from DSE are unit vectors by default !!
    
    If using normal vector components from some other source be sure to normalise te normal vectgor in order to get unit normal vector
    
   CONTACT:
    Hrvoje LUKAČIĆ, MSc
    Research And Teaching Assistant
    Department of Geology and Geological Engineering
    Fculty of Mining, Geology and Petroleum Engineering
    University of Zagreb
    e-mail: hrvoje.lukacic@rgn.unizg.hr

