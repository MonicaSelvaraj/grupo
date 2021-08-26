/* 
MitoCounter Macro
- Converts tif flies to images 
- Automates manual thresholding of images using set parameters 
*/

//Part 1 - Convert tif stacks to images
tifDir ="/home/selvaraj/Desktop/MitoCounter/Input/Stacks_as_tif/"; //Input folder with tif stacks
imgDir ="/home/selvaraj/Desktop/MitoCounter/Input/Stacks_as_images/"; //Output folder to store folders of images for each tif stack
imgOut ="/home/selvaraj/Desktop/MitoCounter/Input/Stacks_as_images/C1-masked/";
setBatchMode(true);
tiflist = getFileList(tifDir);//Get a list of tif files in the Stacks_as_tif folder
for(i=0;i<tiflist.length; i++){
    print("Processing file " + tiflist[i]);
    open(tifDir+tiflist[i]); //Open C1-masked.tif
    run("Stack to Images");
    print("Past run stack to images");
    saveAs("Tiff",imgOut);
    print("past save");
}

/*
//MAIN LOOP
for(i=0;i<list.length;i++){
//The following actions are performed for each z-stack

    open(inputDir+list[i]);
    run("Duplicate...", "duplicate");
	run("Auto Threshold", "method=Yen ignore_black white use_stack_histogram");	outputFilename = substring(list[i],0,lengthOf(list[i])-4);
	/*
	thresholdingOutputPath = "/Users/ms12122/Desktop/Drosophila-germ-plasm/Data/"+outputFilename+"/ZSlices/";
    run("Image Sequence... ", "format=TIFF save=thresholdingOutputPath");
    resultsOutputPath = "/Users/ms12122/Desktop/Drosophila-germ-plasm/Data/"+outputFilename+"/ZResults/";
    zSliceList = getFileList(thresholdingOutputPath);
    for(j=0;j<zSliceList.length;j++){
        open(thresholdingOutputPath+zSliceList[j]);
        run("Image to Results"); //Results files are saved as Results0, Results1, ..
        resultsFileName = "Results"+j;
        saveAs("Results",resultsOutputPath+resultsFileName + ".csv");
        close();
    }close("*");
    selectWindow("Results"); 
    run("Close");
}
setBatchMode(false);
*/
