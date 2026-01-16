nBins = 256;
  //getArgument()
  



name=getTitle();
print(name);

run("Duplicate...", "title=[Duplicate Image]");

setAutoThreshold("Default");
//run("Threshold...");

resetThreshold();
setThreshold(2, 2);
setOption("BlackBackground", true);
run("Convert to Mask");


run("Find Connected Regions", "display_image_for_each display_results regions_must regions_for_values_over=254 minimum_number_of_points=50000 stop_after=1");
waitForUser("Background","Does the background extend into the tissue? \nIf so, draw a black line to isolate that area, \nthen press ok");

run("Find Connected Regions", "display_image_for_each display_results regions_must regions_for_values_over=254 minimum_number_of_points=50000 stop_after=1");
run("Create Selection");
run("Make Inverse");
waitForUser("Background","Looks ok?");


//bg_area=getResult("Area");

run("Make Inverse");

  getHistogram(values, counts, 256);
      setResult("Value", 0, values[255]);
      setResult("Count", 0, counts[255]);
  updateResults();

bg_area=counts[255];


selectWindow(name);
run("Restore Selection");
setForegroundColor(198, 118, 255);
run("Fill", "slice");


run("Make Inverse");


  run("Clear Results");
  row = 0;
  getHistogram(values, counts, nBins);
  for (i=0; i<nBins; i++) {
      setResult("Value", row, values[i]);
      setResult("Count", row, counts[i]);
      row++;
   }
  updateResults();




Alveoli=counts[0];
Fibrotic=counts[1];
Background=counts[2];
Bronchi=counts[3];
Vessel=counts[4];
SupportCollagen=counts[5];
Blood=counts[6];




close();
close();
close();
EmptySpace=bg_area;

//PercentFibrosis=((Fibrotic)/((Fibrotic+Alveoli+Background+Bronchi+Vessel+SupportCollagen+Blood)-bg_area))*100;
//PercentFibrosis=((Fibrotic)/((Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)-bg_area))*100;
  PercentFibrosis=((Fibrotic)/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background))*100;
print(name,"Percent Fibrosis=",PercentFibrosis,"%");

print("Alveoli (red)",(Alveoli/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));//Non-Fibrotic
print("Fibrotic (blue)",(Fibrotic/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));//Fibrotic
print("Background (purple)",(Background/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));//background
print("Bronchi (yellow)",(Bronchi/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));
print("Vessel (cyan)",(Vessel/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));
print("Support Collagen (pink)",(SupportCollagen/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));
print("Blood (lime green)",(Blood/(Fibrotic+Alveoli+Bronchi+Vessel+SupportCollagen+Blood+Background)*100));
//print("Empty space outside tissue area",EmptySpace);

//print("Alveoli (red)",Alveoli);//Non-Fibrotic
//print("Fibrotic (green)",Fibrotic);//Fibrotic
//print("Background (purple)",Background);//background
//print("Bronchi (yellow)",Bronchi);
//print("Vessel (cyan)",Vessel);
//print("Support Collagen (pink)",SupportCollagen);
//print("Blood (lime green)",Blood);
//print("Empty space outside tissue area",EmptySpace);

 
 // make selection on binary image, change window to segmented image, restore selection on segmented image, invert selection, change values of everything in inverted selection to background (2)
 