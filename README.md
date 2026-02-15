# Automated Histology Fibrosis Quantification Using Trainable Weka Segmentation

This repository contains ImageJ/Fiji macros and analysis workflows supporting the paper:
> **Artificial Intelligence–Based Automated Fibrosis Quantification in Preclinical Models of Pulmonary Fibrosis**

<a href="https://imagej.net/software/fiji/"><img alt="ImageJ/Fiji" src="https://img.shields.io/badge/ImageJ-Fiji-00aaff?logo=imagej&logoColor=white"></a>
<a href="https://posit.co/download/rstudio-desktop/"><img alt="RStudio" src="https://img.shields.io/badge/RStudio-276DC3?logo=rstudio&logoColor=white"></a>
<a href="https://www.python.org/downloads/"><img alt="Python" src="https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white"></a>
<a href="https://doi.org/10.XXXX/your-paper-doi"><img alt="Paper" src="https://img.shields.io/badge/Paper-PDF-ff69b4?logo=read-the-docs&logoColor=white"></a>

Pipeline performs supervised machine-learning–based segmentation of preclinical mouse lung histology images followed by automated fibrosis percentage quantification and correlation with Ashcroft scoring.

---
## Dataset Overview
**Input Data**
- Whole-slide or cropped Trichrome-stained lung histology TIFF images

**Segmentation Classes**
- Alveoli  
- Fibrosis  
- Background  
- Bronchi   
- Support Collagen  
- Blood  

*Segmentation is performed using Trainable Weka Segmentation in ImageJ/Fiji.*

---
## Software Requirements

- **ImageJ/Fiji** 
    - https://imagej.net/software/fiji/
    - Install *Trainable Weka Segmentation* plugin  
- **R / RStudio** (Correlation Analysis)
    - Version
- **Python** (Ripley K Analysis)
    - Version 3.11.9 

---
## Segmenttion Model

### Preprocessing 
1. Open the histology image in ImageJ
2. Annotate artifacts and non-lung tissue ROIs using ImageJ ROI Manager
3. Save the ROIs as 'non-lung ROIs'
4. Download and install 'Trainable Weka Segmentation' in ImageJ
5. Close and restart ImageJ

### Training 
1. Open histology image in ImageJ
2. Annotate different tissue classes (e.g Alveoli, Fibrosis, Background, Bronchi, Support Collagen, Blood) using ROI Manager 
3. Save the ROIs of each class in seperate folders
4. Open
   ```
   ImageJ >> Plugins >> Segmentation >> Trainable Weka Segmentation
   ```
5. Load the saved class ROIs and train the Weka classifier
6. Save the trained model ('classifier.model')

### Testing 

### Step 1: Applying the Trained Classifier
1. Open ImageJ **BeanShell Script Editor**
2. Copy the contents in the .txt file:
   ```
   Apply Weka classifier to all images in folder.txt
   ```
3. Past into the BeanShell Scropt Editor and run
4. Select:
   - Input image folder (e.g. `./images`)
   - Output segmentation folder (e.g. `./segmentations`)
5. Select the classifier model:
   ```
   classifier.model
   ```

### Step 2: Run Fibrosis Quantification Macro
1. Open the macro:
   ```
   Isolate_Background_Delete_Extra_Tissue_Get_Values.ijm
   ```
2. Update **three file paths** in the script as needed
    - Input Path (.//images)
    - Output Path (.//segmentations)
    - Model Path (.//classifer.model)

#### What the Macro Does
- Loads pre-defined **non-lung ROIs**
- Removes non-lung tissue from analysis
- Computes **percent fibrosis per image**
- Outputs values to the ImageJ Log window

#### **Output**
- Copy fibrosis percentages from ImageJ Log
- Export results to Excel or CSV

---
## Citation

Roop, B., Calmo, N.M., Bass, A. et al. Artificial intelligence, machine learning-based automated fibrosis quantification in preclinical models of pulmonary fibrosis. Respir Res (2026). https://doi.org/10.1186/s12931-026-03536-2
