setwd("C:\\Users\\JIHYUN\\Downloads")
df <- read.csv("rdata_cosori_B07GJBBGHG.csv")



library(tidytext)
library(dplyr)

#전체 리뷰에 대한 바이그램 생성
text_df <- data_frame(rid=1:nrow(df),text=df$comment)
tidy_bigram <- text_df %>% unnest_tokens(bigram,text,token = "ngrams", n = 2)

#바이그램 개수 세기
tidy_bigram %>%count(bigram,sort=TRUE)

#stop word 제거
library(tidyr) #separate()제공
bigrams_separated <- tidy_bigram %>%
  separate(bigram, c("word1", "word2"), sep = " ")

bigrams_filtered <- bigrams_separated %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)

# 바이그램 빈도 테이블 
bigram_counts <- bigrams_filtered %>% 
  count(word1, word2, sort = TRUE)

# 바이그램 결합 
bigrams_united <- bigrams_filtered %>%
  unite(bigram, word1, word2, sep = " ")

library(dplyr)
library(ggplot)
bigrams_united %>%
  count(bigram,sort=TRUE) %>%
  filter(n >50) %>%
  filter(bigram != c("air fryer")) %>%
  filter(bigram != c("air fryers")) %>%
  filter(bigram != c("NA NA")) %>%
  filter(bigram != c("cosori air")) %>%
  filter(bigram != c("cosori air")) %>%
  filter(bigram != c("5.8 qt")) %>%
  mutate(word=reorder(bigram,n)) %>%
  ggplot(aes(bigram,n)) + 
  geom_col(fill = 'orange3') + 
  xlab(NULL) +
  coord_flip()


bigrams_separated %>%
  filter(word1 == "not") %>%
  count(word1, word2, sort = TRUE)

afinn <- get_sentiments("afinn")


negation_words <- c("not", "no", "never", "without")

negated_words <- bigrams_separated %>%
  filter(word1 %in% negation_words) %>%
  inner_join(afinn, by = c(word2 = "word")) %>%
  count(word1, word2, value, sort = TRUE)


easy_clean <- c("easy","clean")

easy_clean <- bigrams_separated %>%
  filter(word1 %in% easy_clean) %>%
  inner_join(afinn, by = c(word2 = "word")) %>%
  count(word1, word2, value, sort = TRUE)

easy_clean %>%
  mutate(contribution = n * value) %>%
  arrange(desc(abs(contribution))) %>%
  filter(word2 != c("clean"))%>%
  filter(word2 != c("easy"))%>%
  filter(word2 != c("no"))%>%
  filter(word2 != c("pretty"))%>%
  head(20) %>%
  mutate(word2 = reorder(word2, contribution)) %>%
  ggplot(aes(word2, n * value, fill = n * value > 0)) +
  geom_col(show.legend = FALSE) +
  xlab("Words preceded by negation term") +
  ylab("Sentiment value * number of occurrences") +
  coord_flip()


library(igraph) #연결망 시각화 패키지

# 바이그램 빈도 테이블
bigram_counts 

bigram_graph <- bigram_counts %>%
  filter(n > 20) %>% #빈도 기준 설정
  filter(bigram != c("NA")) %>%
  graph_from_data_frame() #연결 관계 생성

bigram_graph

library(ggraph)

set.seed(2020)  #랜덤한 수를 생성 -> 위치 조정

#방향성이 없는 연결망
ggraph(bigram_graph, layout = "fr") +
  geom_edge_link() +
  geom_node_point() +
  geom_node_text(aes(label = name), vjust = 1, hjust = 1) +
  theme_void() %>%
  