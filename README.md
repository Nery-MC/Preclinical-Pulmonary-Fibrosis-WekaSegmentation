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
- Bronchi / Epithelium  
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

### Step 1: Applying the Trained Classifier
1. Open ImageJ **BeanShell Script Editor**
2. Copy and run:
   ```
   Select Apply Weka classifier Classifier…txt
   ```
3. Select:
   - Input image folder (e.g. `./images`)
   - Output segmentation folder (e.g. `./segmentations`)
4. Select the classifier model:
   ```
   classifier_SN_updated.model
   ```

### Step 2: Run Quantification Macro
1. Open the macro:
   ```
   Isolate background delete extra tissue and get values 7C 1-8-21.ijm
   ```
   (located in `./ScriptsandMacros`)
2. Update **three file paths** in the script as needed

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
