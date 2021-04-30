setwd("C:\\Users\\JIHYUN\\Downloads")
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")

df <- subset(df,subset=(stars<=2))

text_df <- data.frame(rid = 1:nrow(df),comment= df$comment)


tidy_text <- text_df %>% unnest_tokens(word,comment,token = "ngrams", n = 1)


data("stop_words")
tidy_text <- tidy_text %>% anti_join(stop_words) #불용어 사전에 있는 단어 제거

library(dplyr)
library(ggplot2)
tidy_text %>%
  count(word,sort=TRUE) %>%
  filter(n > 500) %>%
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
  count(word) %>%
  with(wordcloud(word,n,max.words=100))

#version2
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(50) %>%
  wordcloud2()

#version3
tidy_text %>% 
  anti_join(stop_words) %>%
  count(word,sort = TRUE)%>%
  head(50) %>%
  wordcloud2(size = 1.2, color = "random-light", fontFamily = 'Tahoma', minRotation = -pi/2, maxRotation = -pi/2)
library(reshape2)


tidy_text %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment,sort=TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill=0) %>%
  comparison.cloud(colors = c("orange", "navy"), max.words = 100)

library(tidytext)
library(textdata)
library(dplyr)


bing <- get_sentiments("bing")
afinn <- get_sentiments("afinn")
nrc <- get_sentiments("nrc")
nrc

nrc_anger <- get_sentiments("nrc") %>%
  filter(sentiment == "anger") #특정 감정 표현 단어 추출(nrc)

word_anger <- tidy_text %>%
  inner_join(nrc_anger) %>% #정돈데이터와 용어집 결합
  count(word,sort=TRUE) %>%
  filter(word !=c("battery","money","lawsuit"))   #사용자 지정 감정사전 만들기

#문서와 감성사전을 단어를 기준으로 매칭하여 결합
text_afinn <- tidy_text %>%
  inner_join(afinn, by = "word") 

#단어 요약표
word_summary <- text_afinn %>%
  group_by(word) %>%
  summarise(count_word = n(),afinn_score=max(value)) %>%
  arrange(desc(count_word))

#긍정단어/부정단어 빈도 그래프
bing_word_counts <- tidy_text %>%
  inner_join(bing) %>% #bing 감성사전 활용
  count(word, sentiment, sort = TRUE) %>%
  ungroup() %>%
  filter(word != c("noise"))


bing_word_counts %>%
  group_by(sentiment) %>%
  top_n(20) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Contribution to sentiment", x = NULL) +
  coord_flip()



#단어 감성 기여도
contributions <- tidy_text %>%
  inner_join(get_sentiments("afinn"), by = "word") %>%
  group_by(word) %>%
  summarize(빈도 = n(),기여도 = sum(value))

contributions %>%
  top_n(30, abs(기여도)) %>%
  mutate(word = reorder(word, 기여도)) %>%
  ggplot(aes(word, 기여도, fill = 기여도 > 0)) +
  geom_col(show.legend = FALSE) +
  coord_flip()

#리뷰 단위로 단어 감성지수 평균 계산
sentiment_messages <- tidy_text %>%
  inner_join(get_sentiments("afinn"), by = "word") %>%
  group_by(rid) %>%
  summarize(sentiment = mean(value), mins = min(value), maxs = max(value),
            words = n()) %>%
  ungroup() %>%
  filter(words >= 5) 

#긍정리뷰 순 정렬
prewviews <-sentiment_messages %>% 
  arrange(desc(sentiment)) #내림차순 정렬

#부정리뷰 순 정렬
nrewviews <-sentiment_messages %>%
  arrange(sentiment) #오름차순 정렬

#원본 리뷰 확인  (가장 긍정적 리뷰 확인하기 rid =199번째)
original_review <- text_df %>% filter(rid == 12)
original_review$text

pmax <- max(prewviews$sentiment) 
df1 <- subset(df$stars,subset=(rid==pmax))

text_df1 <- data.frame(rid=1:nrow(df),text=df＄comment, stars = df＄stars)
corr(mean(sentiment_messages$sentiment), )
