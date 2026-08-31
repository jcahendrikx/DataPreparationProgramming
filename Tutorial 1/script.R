data_url <- paste0("https://raw.githubusercontent.com/hannesdatta/course-dprep/refs/heads/main/material/tutorials/r-bootcamp-rev/video_view.csv")
download.file(data_url, "Tutorial 1/video_view.csv")
list.files()

library(tidyverse)
library(conflicted)
videos <- read_csv("Tutorial 1/video_view.csv")

head(videos)
nrow(videos)
glimpse(videos)
summary(videos)

#Example coutning number of NAs

sum(is.na(videos$video_length_sec)) # Old school, onion coding

videos$video_length_sec %>% is.na() %>% sum() #new style, prettier(?)

#Selecting certain columns
Selection <- videos %>% select(video_id, creator_id, impressions_n, watched_n, watch_rate)

summary(Selection)

#Codig step 8
videos %>% dplyr::filter(watch_rate > 0.7, impressions_n >= 20)

#Coding step 9
creator_stats <- videos %>%
  summarize(
    impressions_total = sum(impressions_n, na.rm = TRUE),
  watch_rate_avg = mean(watch_rate, na.rm = TRUE),
.by = creator_id)

#Small practices
videos %>%
  dplyr::filter(watch_rate >= 0.8) %>% count()

videos %>%
  select(video_id, creator_id, watch_rate)

Sorted_Watch <- videos %>% 
  summarize(avg_watch_rate = mean(watch_rate), .by = creator_id)

Sorted_Watch %>%
  arrange(desc(avg_watch_rate))
 
