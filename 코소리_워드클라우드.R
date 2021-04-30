setwd("C:\\Users\\JIHYUN\\Downloads")
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")
library("tm")
df$comment=removeWords(df$comment, stopwords("it's"))
df$comment <-gsub("cooking|cooked|cooks","cook",df$comment)
df$comment <-gsub("fries|fried","fry",df$comment)
df$comment <-gsub("cosori|it's|lot","",df$comment)
df$comment <-gsub("foods","food",df$comment)


library(tidytext)
library(dplyr)

text_df <-data.frame(rid = 1:nrow(df),comment= df$comment)

tidy_text <- text_df %>% unnest_tokens(word,comment,token = "ngrams", n = 1)


data("stop_words")
tidy_text <- tidy_text %>% anti_join(stop_words) #불용어 사전에 있는 단어 제거

library(dplyr)
library(ggplot2)
tidy_text %>%
  count(word,sort=TRUE) %>%
  filter(n > 100) %>%
  filter(word != c("air")) %>%
  filter(word != c("fry")) %>%
  filter(word != c("fryer")) %>%
  filter(word != c("it's")) %>%
  mutate(word=reorder(word,n)) %>%
  ggplot(aes(word,n)) + 
  geom_col() + 
  xlab(NULL) +
  coord_flip()


library(wordcloud)
library(wordcloud2)

#version1
tidy_text %>% 
  anti_join(stop_words) %>%
  filter(word != c("fryer","air","fries","cosori")) %>%
  count(word) %>%
  with(wordcloud(word,n,max.words=100))

#version2
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  filter(word != c("fryer","air","fries","cosori")) %>%
  head(50) %>%
  wordcloud2()

#version3
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(50) %>%
  filter(word != c("air")) %>%
  filter(word != c("fry")) %>%
  filter(word != c("fryer")) %>%
  filter(word != c("fryer")) %>%
  filter(word != c("it's")) %>%
  filter(word != c("cook")) %>%
  filter(word != c("cosori")) %>%
  filter(word != c("food")) %>%
  filter(word != c("foods")) %>%
  filter(word != c("bought")) %>%
  filter(word != c("purchase")) %>%
  filter(word != c(2)) %>%
  wordcloud2(size = 1.2, color = "random-light", fontFamily = 'Tahoma', minRotation = -pi/2, maxRotation = -pi/2)
library(reshape2)


tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment,sort=TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill=0) %>%
  comparison.cloud(colors = c("orange", "navy"), max.words = 100)

