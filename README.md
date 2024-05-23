# EVsUptakeTimeLapseConfocal
Developed by: Michelli Ramires Teixeira
 *  ORCID:0000-0001-6694-9348		  email: michelli.rt@gmail.com
 *  Sao Paulo - Brazil
This code was developed to quantify extracellular vesicles (EVs) labeled with VibrantDiO and analyzed using time-lapse confocal microscopy. The ImageJ/FIJI analysis was performed using only the fluorescence channel (not tested on bright field images), which was split in the LAS X software (Leica Microsystems). Ensure the images are saved in high-quality ".tiff" format to facilitate the quantification process. Although it was developed specifically for fluorescent dye-labeled EVs, it will probably work for other types of labeling in experiments requiring sequential analysis of multiple images, possibly needing just a few adaptations.

The macro first asks if the user wants to calibrate the scale. If yes, ensure that you apply global calibration to all the images in the directory.
Set the threshold you want the macro to apply to the rest of the images in the directory (DO NOT PRESS "APPLY").
The macro will then ask the user to select the directory containing the images to quantify (ensure the directory contains only the images you want to quantify).
The macro will run and provide the label, area, and % area for each image.
The results will be saved inside the directory of the images in a .csv file.

Feel free to adapt the code for your use.

