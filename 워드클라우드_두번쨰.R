setwd("C:\\Users\\JIHYUN\\Downloads")
library(tm)
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")
df$comment <- gsub("cooks|cooking|cooked","cook",df$comment)
df$comment <- gsub("purchased","purchase",df$comment)
df$comment <- gsub("foods","food",df$comment)
df$comment <- gsub("recipes","recipe",df$comment)
df$comment <- gsub("times|minute|minutes","time",df$comment)
#df$comment <- gsub("times","time",df$comment)
#df$comment <- gsub("minutes","minute",df$comment)
df$comment <- gsub("(^')|('$)" ,"" ,df$comment)
df$comment <- gsub("wings" ,"wing" ,df$comment)
df$comment <- gsub("makes" ,"make" ,df$comment)
df$comment <- gsub("[[:punct:]]", " ", df$comment)
df$comment <- gsub("fried|fries","fri",df$comment)
df$comment <- gsub("fryers","fryer",df$comment)

#긍정 감정 형용사 제거 
#df$comment <- gsub("happy|super|nice|perfect|awesome|amazing","love",df$comment)

#없애고싶어서 제거해본다
df$comment <- gsub("4|week|months","",df$comment)

#counter랑 kitchen이랑 같은뜻?


library(tidytext)
library(dplyr)

text_df <-data.frame(rid = 1:nrow(df),comment= df$comment)

tidy_text <- text_df %>% unnest_tokens(word,comment,token = "ngrams", n = 1)


data("stop_words")

tidy_text <- tidy_text %>% anti_join(stop_words) #불용어 사전에 있는 단어 제거

library(wordcloud2)
library(dplyr)
library(ggplot2)
tidy_text <-tidy_text %>%
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(50)

tidy_text <-tidy_text %>%
  filter(word != c("air")) %>%
  filter(word != c("fry")) %>%
  filter(word != c("purchase")) %>%
  filter(word != c("lot")) %>%
  filter(word != c("unit")) %>%
  filter(word != c("highly")) %>%
  filter(word != c("2")) %>%
  filter(word != c("5")) %>%
  filter(word != c("3")) %>%
  filter(word != c("day")) %>%
  filter(word != c("2")) %>%
  filter(word != c("buy")) %>%
  filter(word != c("dont")) %>%
  filter(word != c("ive")) %>%
  filter(word != c("don")) %>%
  filter(word != c("cosori")) %>%
  filter(word != c("product")) %>%
  filter(word != c("appliance")) %>%
  filter(word != c("bought")) %>%
  filter(word != c("love")) %>%
  filter(word != c("fri")) %>%
  filter(word != c("ve")) %>%
  filter(word != c("reviews")) %>%
  filter(word != c("fryer"))

tidy_text %>% wordcloud2(size = 1.2, color = "random-light",fontFamily = 'Tahoma', minRotation = -pi/2, maxRotation = -pi/2)

library(dplyr)
library(ggplot2)
tidy_text %>%
#  count(word,sort=TRUE) %>%
  filter(n >200) %>%
  mutate(word=reorder(word,n)) %>%
  ggplot(aes(word,n)) + 
  geom_col(fill = 'palegreen4') + 
  xlab(NULL) +
  coord_flip()

