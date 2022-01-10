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
  
- [03-lecturer-variation.Rmd](03-lecturer-variation.Rmd) ([output](https://htmlpreview.github.io/?https://github.com/georgekinnear/lecturer-questions/blob/main/03-lecturer-variation.html))
  
  Produces summaries of the sample of questions, broken down by lecturer and question category.
  
- [04-wait-times.Rmd](04-wait-times.Rmd) ([output](https://htmlpreview.github.io/?https://github.com/georgekinnear/lecturer-questions/blob/main/04-wait-times.html))

  Analysis of questions broken down by category and wait time.
  
- [05-question-chains.Rmd](05-question-chains.Rmd) ([output](https://htmlpreview.github.io/?https://github.com/georgekinnear/lecturer-questions/blob/main/05-question-chains.html))

  Analysis of "question chains", which are related questions asked in succession (e.g. to give hints or elaborate).
  
  