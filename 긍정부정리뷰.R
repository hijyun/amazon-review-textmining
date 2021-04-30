setwd("C:\\Users\\JIHYUN\\Downloads")
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")

df <- df[grep("recipe book", df$comment),]

text_df <-data.frame(rid = 1:nrow(df),comment= df$comment)

tidy_text <- text_df %>% unnest_tokens(word,comment,token = "ngrams", n = 1)


data("stop_words")

tidy_text <- tidy_text %>% anti_join(stop_words) #불용어 사전에 있는 단어 제거


#리뷰 단위로 단어 감성지수 평균 계산
sentiment_messages <- tidy_text %>%
  inner_join(get_sentiments("afinn"), by = "word") %>%
  group_by(rid) %>%
  summarize(sentiment = mean(value),
            words = n()) %>%
  ungroup() %>%
  filter(words >= 5) 



#긍정리뷰 순 정렬
prewviews <-sentiment_messages %>% 
  arrange(desc(sentiment)) #내림차순 정렬

#부정리뷰 순 정렬
nrewviews <-sentiment_messages %>%
  arrange(sentiment) #오름차순 정렬

#원본 리뷰 확인 
original_review <- text_df %>% filter(rid == 82)
original_review$text
