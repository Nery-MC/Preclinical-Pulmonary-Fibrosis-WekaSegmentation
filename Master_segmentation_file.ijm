//run("Tile segmentation batch macro");//saved as plugin in macro folder

  
  //listOfFiles=getFileList("D:/Fibrosis Quantification Project/S12-26836 B3-6 T 1600 percent bigger crop/Segmented All data 8-14 mean variance entropy bilateral 2x6");
  listOfFiles=getFileList("C:\\Users\\nm1076\\Partners HealthCare Dropbox\\Nery Matias Calmo\\Sreyankar_Bleo\\Nery_pliant\\25.02.14_NewModel\\");
  NumSegmentedImages=lengthOf(listOfFiles);
  print(NumSegmentedImages);
  
for (i = 0; i < NumSegmentedImages; i++) {


open("C:\\Users\\nm1076\\Partners HealthCare Dropbox\\Nery Matias Calmo\\Sreyankar_Bleo\\Nery_pliant\\25.02.14_NewModel\\" + listOfFiles[i]);

directory = getDirectory("Image");
filename = getTitle();
  filename=replace(filename,".tif","_");
  sep = File.separator;
print(filename);
//print(directory+"non-lung ROI/"+filename+"roi.zip");
ROIFile=directory+"non-lung ROI/"+filename+"roi.zip";
//ROIFile="C:/Users/akd39/Desktop/BleoData/Daniella Mouse Trichrome/Feature training 12-31/Rachel TIFFs/test/non-lung ROI/439 6-_T 2.5x_roi.zip";
//print(ROIFile);
rename("trichrome");

if (File.exists(ROIFile)){
      roiManager("Open",ROIFile);
      roiManager("Show All");
      if (roiManager("count")>1){
      roiManager("combine");}
      else{roiManager("select",0);}
      //waitForUser("Extra Tissue","Correct tissue area?\nIf not, select non-lung tissue \nHold shift to make multiple selections \nThen press ok");
      roiManager("Save", ROIFile);}
else{
print("File not found");
	waitForUser("Extra Tissue","Select non-lung tissue \nHold shift to make multiple selections \nThen press ok");
roiManager("Add");
roiManager("Save", ROIFile);
}
selectWindow("ROI Manager");
run("Close");

open("C:\\Users\\nm1076\\Partners HealthCare Dropbox\\Nery Matias Calmo\\Sreyankar_Bleo\\Nery_pliant\\25.02.14_NewModel_Segmented\\" + listOfFiles[i]);
//print("");

run("Restore Selection");
setForegroundColor(198, 118, 255);
run("Fill", "slice");
selectWindow("trichrome");
run("Revert");
run("Select None");
close();
run("Select None");
//runMacro("Display_values_5Categories.ijm");//works but is saved in macro folder
//runMacro("Isolate background and get values 7C.ijm");	
runMacro("C:\\Users\\nm1076\\Partners HealthCare Dropbox\\Nery Matias Calmo\\Sreyankar_Bleo\\ScriptsandMacros\\Isolate background delete extra tissue and get values 7C 1-8-21.ijm");
	close();
}
    