# EVsUptakeTimeLapseConfocal
Developed by: Michelli Ramires Teixeira
 *  ORCID:0000-0001-6694-9348		  email: michelli.rt@gmail.com
 *  Sao Paulo - Brazil
This code was developed to quantify extracellular vesicles dyed with VibrantDiO and analyzed by time-lapse confocal microscopy. The analysis is performed using only the fluorescence channel, split in the LAS X software (Leica Microsystems). Ensure the images are saved in ".tiff" format and in high quality to ease the quantification process.

The macro first asks if the user wants to calibrate the scale. If yes, ensure that you apply global calibration to all the images in the directory.
Set the threshold you want the macro to apply to the rest of the images in the directory (DO NOT PRESS "APPLY").
The macro will then ask the user to select the directory containing the images to quantify (ensure the directory contains only the images you want to quantify).
The macro will run and provide the label, area, and % area for each image.
The results will be saved inside the directory of the images in a .csv file.

Feel free to adapt the code for your use.

