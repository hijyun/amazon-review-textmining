setwd("C:\\Users\\JIHYUN\\Downloads")
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")
df$comment <- gsub("loved|loves|loving|lovely" ,"love" ,df$comment)
df$comment <- gsub("reached","reach",df$comment)
df$comment <- gsub("luckily","luck",df$comment)
df$comment <- gsub("stopped|stoping|stops","stop",df$comment)
df$comment <- gsub("mad","crazy",df$comment)
df$comment <- gsub("cool","nice",df$comment)
df$comment <- gsub("disappointed|worthless","disappoint",df$comment)
df$comment <- gsub("issues","issue",df$comment)
df$comment <- gsub("dead|death","die",df$comment)
df$comment <- gsub("weakness","weak",df$comment)
df$comment <- gsub("lol|yeah|wow|god|yucky|ha|Lol","",df$comment)
df$comment <- gsub("lol","",df$comment)
df$comment <- gsub("fall|falling|fallen|falls|fell|failed","fall",df$comment)
df$comment <- gsub("disappointing|disapointed","disapointment",df$comment)
df$comment <- gsub("struggled|struggling","struggle",df$comment)
df$comment <- gsub("worthy|worth","worthy",df$comment)
df$comment <- gsub("worried|worry","worried",df$comment)
df$comment <- gsub("wishing|wishes","wish",df$comment)
df$comment <- gsub("win|winner|wins","wish",df$comment)
library(tidytext)
library(dplyr)
library(janeaustenr)
library(tidytext)
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")
#데이터 프레임 구성 
text_df <- data_frame(rid=1:nrow(df),text=df$comment)

#단어들로 분리(토큰화)
tidy_text <- text_df %>% unnest_tokens(word,text,token = "ngrams", n = 1)

#stop word제거
data(stop_words) #불용어(stopword) 사전 가져오기
tidy_text <- tidy_text %>% 
  anti_join(stop_words, by="word") #불용어 사전에 있는 단어 제거

#문서-단어 카운트 계산
word_counts <- tidy_text %>%
  count(rid, word, sort=TRUE) 

total_words <- word_counts %>% 
  group_by(word) %>% 
  summarize(total = sum(n))

word_counts <- left_join(word_counts,total_words)


word_counts <- word_counts %>%
  bind_tf_idf(word, rid, n)

word_counts %>%
  select(-total) %>%
  arrange(desc(tf_idf))


library(dplyr)
library(ggplot2)
word_counts %>%
  arrange(desc(tf_idf)) %>%
  mutate(word = factor(word, levels = rev(unique(word)))) %>% 
  top_n(50) %>%
  ggplot(aes(word, tf_idf)) +
  geom_col() +
  labs(x = NULL, y = "tf-idf") +
  coord_flip()



