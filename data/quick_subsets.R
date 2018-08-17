install.packages('dplyr')
library(readr)
library(dplyr)

setwd("/Users/l245854/Desktop/devmtn/personalProject/pals/data")

in_ill_coords <- read_csv("injury_coordinates.csv")

names(in_ill_coords)

in_ill_coords$`Incident Date` <- as.Date(in_ill_coords$`Incident Date`)

ta_bldg <- unique(in_ill_coords$ta_bldg)
factors <- unique(in_ill_coords$FACTORS1)
jobs <- unique(in_ill_coords$`Job Title`)
body_parts <- unique(in_ill_coords$BODY_PARTS)



write.table(ta_bldg, file='Unique_locations.csv', row.names = FALSE, col.names = FALSE, sep=",", na="")
write.table(factors, file='Unique_factors.csv', row.names = FALSE, col.names = FALSE, sep=",", na="")
write.table(jobs, file='Unique_jobs.csv', row.names = FALSE, col.names = FALSE, sep=",", na="")
write.table(body_parts, file='Unique_bodyParts.csv', row.names = FALSE, col.names = FALSE, sep=",", na="")

# non_miss_loc <- subset(in_ill_coords, (!is.na(in_ill_coords$latitude) & (!is.na(in_ill_coords$longitude))))

non_miss_loc <- in_ill_coords %>%
  select("Incident Date", ta_bldg, "latitude",  "longitude", "Job Title", "FACTORS1", "FACTORS2", "BODY_PARTS", )%>%
  filter(!is.na(latitude) & !is.na(longitude))

# Small subset
small_df <- sample_n(non_miss_loc, 200)

write_csv(small_df, "in_ill_subset.csv")

typeof(small_df$`Incident Date`)
