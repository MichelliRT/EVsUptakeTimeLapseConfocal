/* Developed by: Michelli Ramires Teixeira
 *  ORCID:0000-0001-6694-9348		  email: michelli.rt@gmail.com
 *  Sao Paulo - Brazil
This code was developed to quantify extracellular vesicles dyed with VibrantDiO and analyzed by time-lapse confocal microscopy. The analysis is performed using only the fluorescence channel, split in the LAS X software (Leica Microsystems). Ensure the images are saved in ".tiff" format and in high quality to ease the quantification process.

The macro first asks if the user wants to calibrate the scale. If yes, ensure that you apply global calibration to all the images in the directory.
Set the threshold you want the macro to apply to the rest of the images in the directory (DO NOT PRESS "APPLY").
The macro will then ask the user to select the directory containing the images to quantify (ensure the directory contains only the images you want to quantify).
The macro will run and provide the label, area, and % area for each image.
The results will be saved inside the directory of the images in a .csv file.

Feel free to adapt the code for your use.

*/


// Ask the user if they want to calibrate the scale
doCalibrate = getBoolean("Do you want to calibrate the scale?", "Yes", "No");

// If the user wants to calibrate the scale
if (doCalibrate) {
    // Get the path of the image to set the scale
    scaleFilePath = File.openDialog("Choose an image to set the scale");

    // Open the selected image
    open(scaleFilePath);

   // Let the user set the scale (if the image does not contain scale information in its metadata, you can use an image with a scale bar to set the scale)
    waitForUser("Set the scale using 'Analyze > Set Scale...' and press OK.");

    // Close the image used to set the scale
    close();
}

// Get the path of the image to set the threshold
filePath = File.openDialog("Choose an image to set the threshold");

// Open the selected image
open(filePath);

// Let the user adjust the threshold
run("8-bit");
run("Threshold...");
waitForUser("Adjust the threshold and press OK. Then close the Threshold window.");

// Get the current threshold values set by the user
getThreshold(thresholdMin, thresholdMax);


// Get the directory path containing the images to process
dir = getDirectory("Choose a directory of the images");

// Get the list of files in the directory
fileList = getFileList(dir);

// Initialize variable for saving results
nomeSalvar = File.getName(dir);

// Set measurements to include image name, mean, and percentage of area
run("Set Measurements...", "label area mean area_fraction limit display add redirect=None decimal=3");

// Loop through the images in the directory
for (i = 0; i < fileList.length; i++) {
    open(dir + fileList[i]);

    // Apply the user-defined threshold values to all images
    run("8-bit");
    setThreshold(thresholdMin, thresholdMax);
    run("Convert to Mask");
    setOption("BlackBackground", true);
    run("Measure");

    // Close the image used for measurement
    close(); 
}

// Save the results
saveAs("Results", dir + nomeSalvar + ".csv");
