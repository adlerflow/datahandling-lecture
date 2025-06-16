# Comparison of 2023 vs 2024 Lecture Slides - NEW CONTENT ONLY

## Overview
- 2023: Uses .Rmd format with ioslides presentation
- 2024: Many lectures converted to .qmd format (Quarto) with revealjs/xaringan
- 2024: Added new file `06_02_non_rectangular_data_json_html.qmd`
- 2024: Renamed lecture 9 from "visualization" to "EDA_visualization"

## Lecture 1: Introduction

### NEW in 2024:
1. **Interactive survey**: Changed from static tinyurl to interactive Shiny app with QR code
   - 2023: `https://tinyurl.com/data-handling2023`
   - 2024: `https://datahandling.shinyapps.io/DataHandlingIntro/`

2. **New section: "Philosophy of this course"**
   - Includes apprenticeship imagery
   - More detailed learning objectives with emojis
   - "At the end of the course, you will be able to..." section
   - Emphasis on transferable skills and hands-on approach

3. **New "The tools" section**
   - Detailed "Why R?" explanation
   - Git/GitHub integration instructions
   - Code examples for cloning repository

4. **Updated team**: 
   - 2023: Matthias Rösti, Andrea Burro, Aurélien Sallin
   - 2024: Federica Mascolo, Andrea Burro, Aurélien Sallin

5. **Special lectures updated**:
   - 2023: Industry Insights (Zalando) and Federal Administration Insights
   - 2024: "R from a student's perspective" (Minna Heim) and Industry/Consulting (Rachel Lund, Deloitte)

6. **New visual elements**:
   - Break slide with custom background image
   - More modern slide transitions and styling

## Lecture 2: Programming with Data

### NEW in 2024:
1. **Matrices section**: Added as a new concept between vectors and operators
   - Visual representation of matrices
   - Code examples showing cbind, rbind, and matrix() functions
   - "Matrices are combinations of vectors" explanation

2. **Enhanced operator examples**: 
   - Side-by-side code and output display
   - More visual presentation of results

3. **New visual style**: 
   - Converted from ioslides to xaringan
   - Added pull-left/pull-right formatting for better code display

## Lecture 3: Data and Data Processing

### NEW in 2024:
1. **Format change**: Converted from .Rmd (ioslides) to .qmd (Quarto/revealjs)

2. **New warm-up exercises**:
   - Matrix manipulation examples with `mymatrix`
   - More complex warm-up questions involving apply() functions
   - Spicy (🌶️) challenge questions about while loops and apply equivalents

3. **Functionals**: Added to the list of basic programming concepts

4. **More interactive Q&A format**: Using columns layout for questions and answers

## Lecture 4: Data Structure and Storage

### NEW in 2024:
1. **Format change**: Converted to .qmd format

## Lecture 5: Rectangular Data Import

### NEW in 2024:
1. **Format change**: Converted to .qmd format

## Lecture 6: Non-rectangular Data

### NEW in 2024:
1. **Split into two files**:
   - `06_non_rectangular_data.qmd` (main lecture)
   - `06_02_non_rectangular_data_json_html.qmd` (NEW - focused on JSON and HTML)

2. **New lecture component (06_02)**: Dedicated session on JSON and HTML data handling
   - Mock exam announcement
   - Detailed XML parsing examples (Word document XML structure)
   - JSON data handling with practical examples
   - HTML web scraping techniques
   - Links to guest lecture on APIs by Minna Heim

## Lecture 7: Data Preparation

### NEW in 2024:
1. **Format change**: Converted to .qmd format

## Lecture 8: Basic Analytics

### NEW in 2024:
1. **Format change**: Converted to .qmd format

## Lecture 9: Visualization → EDA & Visualization

### NEW in 2024:
1. **Title change**: From "Visualization" to "EDA_visualization"
   - Explicit focus on Exploratory Data Analysis (EDA)
   - Integration of EDA concepts with visualization

2. **Format change**: Converted to .qmd format

3. **New content**:
   - Warm-up exercises on data manipulation (mutate, summarize)
   - Complex joining exercises with multiple keys
   - Additional dplyr tools: `ifelse()`, `case_when()`, `stringr` functions
   - Emphasis on when to use tables vs charts for data communication

## Lecture 10: Visualization (NEW)

### NEW in 2024:
1. **Completely new lecture**: Second part of visualization content
   - Grammar of graphics deep dive with mtcars examples
   - Progressive visualization from 2D to 6D using ggplot2
   - Interactive quiz on `geom_bar()`
   - New topic: "Work with text data"
   - Detailed exam preparation guidance
   - Lockdown browser instructions
   - More emphasis on practical ggplot2 implementation

## Summary of Major Changes

1. **Technology upgrade**: Migration from R Markdown (.Rmd) to Quarto (.qmd) for most lectures
2. **Content expansion**: 
   - Added matrices to programming concepts
   - Split non-rectangular data into two parts
   - Expanded visualization content across two lectures
   - Added EDA (Exploratory Data Analysis) content
3. **Pedagogical improvements**:
   - More interactive elements (Shiny app for survey)
   - Better visual formatting with modern presentation frameworks
   - More hands-on examples and challenges
   - Git/GitHub integration for course materials
4. **Team and guest speakers**: Updated to reflect current instructors and industry connections

## New Visual Materials Added in 2024

### Key new images and visual aids:
- **QR_APP_2024.png**: Interactive survey QR code for introduction
- **break-picture.png**: Custom break slide imagery
- **dplyr_blocks.png**: Visual representation of dplyr functions
- **functionals.png**: New visualization for functional programming
- **tidyverse_pipeline.png**: Data pipeline visualization
- **data_structure_R.png**: R data structures visualization
- **chart_decision_tree.png/webp**: Decision tree for chart selection
- **datainkratio_final.webp**: Tufte's data-ink ratio concept
- **dubois_challenge.jpg/png**: W.E.B. Du Bois visualization examples
- **economist_example.png**: New visualization example
- **readxl.png** and **openxlsx.png**: Package visuals
- **midjourney_** series: AI-generated warm-up and break images
- **meme2.png**, **meme_floating.webp**, **meme_old_code.jpg**: New programming memes
- **fede.jpg**, **federica_small.jpg**: New team member photos
- **swica-logo-e.svg**: Updated employer branding

### Thematic additions:
- More emphasis on data visualization principles (Tufte, Du Bois)
- AI-generated imagery for engagement (Midjourney)
- Enhanced package-specific visuals
- More memes and humorous content for student engagement
