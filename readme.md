# Lecturers' use of questions in undergraduate mathematics lectures

## Data

The `data` folder contains anonymised datasets:

- [`ANON_courses.csv`](data/ANON_courses.csv) - summary of the various courses and lecturers in the sample
- [`ANON_LQ_Maths_All.csv`](data/ANON_LQ_Maths_All.csv) - full details of each question asked during the lectures, following the coding process described in the paper
- [`paoletti_table3_data.csv`](data/paoletti_table3_data.csv) - existing data from Paoletti et al. (2018)

The script [`00-data-import.R`](00-data-import.R) was used to pull in these data files and anonymise them.

## Analyses

- [01-data-summary.Rmd](01-data-summary.Rmd) ([output](https://htmlpreview.github.io/?https://github.com/georgekinnear/lecturer-questions/blob/main/01-data-summary.html))

  Reads in all of the data and presents various summaries, e.g. breakdown of questions by category and lecture.
  
- [02-comparison-with-paoletti.Rmd](02-comparison-with-paoletti.Rmd) ([output](https://htmlpreview.github.io/?https://github.com/georgekinnear/lecturer-questions/blob/main/02-comparison-with-paoletti.html))
  
  Reads the Paoletti et al. (2018) data, and presents a summary of the comparable lectures from our sample.
