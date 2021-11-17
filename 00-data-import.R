# This script reads data files from elsewhere and saves anonymised versions into the /data folder

library(tidyverse)

all_qs <- read_csv(file = '../Analysis/LQ_Maths_All.csv')
courses_dates <- read_csv(file = '../Analysis/courses_dates.csv')
anon_courses <- read_csv(file = '../Analysis/anon_courses.csv')

#
# Save the anonymised course information
#
anon_courses %>% 
  select(anon_code, anon_course, anon_lec, course_level, course_topic, room_cap, advanced) %>% 
  write_csv(file = "data/ANON_courses.csv")

#
# Tidy up and anonymise the LQ_Maths_All dataset
#
codes <- c("A", "C", "E", "F", "N", "O", "P", "U", "W", "X")

code_names <- c("Admin", "Convention", "Evaluation", "Fact", "Next step", "Other",
                "Proof framework", "Understanding check", "Warrant", "Example generation")

code_details = tibble(code = codes, code_name = code_names) %>% 
  mutate(
    collapsed_code = case_when(
      code %in% c("C", "P", "X", "O") ~ "Other",
      TRUE ~ code_name
    )
  ) %>% 
  add_row(
    code = "Total",
    code_name = "Total",
    collapsed_code = "Total"
  )

# Collapsing C, P, X, O into Other
collapsed_codes <- c("A", "O", "E", "F", "N", "O", "O", "U", "W", "O")

# Anonymising courses
courses_dates <- courses_dates %>%
  mutate(course  = plyr::mapvalues(course, anon_courses$course, anon_courses$anon_code)) %>% 
  group_by(course) %>% 
  mutate(
    session = paste0("S", row_number())
  )

all_qs <- all_qs %>%
  mutate(is_cluster = as_factor(if_else(cluster_q == "N", "N", "Y"))) %>%
  mutate(course = plyr::mapvalues(course, anon_courses$course, anon_courses$anon_code)) %>% 
  # fix a few instances where spaces were used rather than underscores, preventing matching with other spreadsheets
  mutate(date = str_replace_all(date, " ", "_")) %>% 
  left_join(code_details, by = c("category" = "code")) %>% 
  left_join(courses_dates) %>% 
  relocate(session, .after = date)

# Making list of all lectures and category code combos
lec_cat <- expand_grid(
  courses_dates,
  category = codes
)

# this table adds extra rows, one for each observed lecture, where only the 
# course_lecturer code and the date are present and all other entries are NA.
# This is used later on to make sure lectures with no questions are included.
all_qs_all_lecs <- all_qs %>%
  bind_rows(
    courses_dates
  )

all_qs_all_lecs %>%
  select(-date) %>% 
  write_csv("data/ANON_LQ_Maths_All.csv", na = "")

#
# Save the Paoletti et al. (2018) data
#
file.copy("../Analysis/paoletti_table3_data.csv", "data/paoletti_table3_data.csv")
