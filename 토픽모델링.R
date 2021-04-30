df <- read.csv("rdata_cosori_B07GJBBGHG.csv")
#특수문자제거
df$comment <- gsub("loved|loves|loving|lovely" ,"love" ,df$comment)
df$comment <- gsub("reached","reach",df$comment)
df$comment <- gsub("stopped|stoping|stops","stop",df$comment)
df$comment <- gsub("crazye","crazy",df$comment)
df$comment <- gsub("issues","issue",df$comment)
df$comment <- gsub("weakness","weak",df$comment)
df$comment <- gsub("lol|yeah|wow|god|yucky|ha|blah","",df$comment)
df$comment <- gsub("fall|falling|fallen|falls|fell|failed","fall",df$comment)
df$comment <- gsub("struggled|struggling","struggle",df$comment)
df$comment <- gsub("bored|boring","bore",df$comment)
df$comment <- gsub("accidental|accidentally","accident",df$comment)
df$comment <- gsub("accomplished","accomplish",df$comment)
df$comment <- gsub("agreed","agree",df$comment)
df$comment <- gsub("amaze|amazed","amazing",df$comment)
df$comment <- gsub("angry","anger",df$comment)
df$comment <- gsub("abilities","ability",df$comment)
df$comment <- gsub("annoying","annoy",df$comment)
df$comment <- gsub("apologized","apologize",df$comment)
df$comment <- gsub("appreciated","appreciates",df$comment)
df$comment <- gsub("attracted","attack",df$comment)
df$comment <- gsub("avoided","avoid",df$comment)
df$comment <- gsub("badly","bad",df$comment)
df$comment <- gsub("beautifully","beautiful",df$comment)
df$comment <- gsub("benefits","benefit",df$comment)
df$comment <- gsub("bless","blessing",df$comment)
df$comment <- gsub("broken","broke",df$comment)
df$comment <- gsub("bothered|bothers","bother",df$comment)
df$comment <- gsub("cheated","cheat",df$comment)
df$comment <- gsub("comfortable","comfort",df$comment)
df$comment <- gsub("complained|complains","complain",df$comment)
df$comment <- gsub("confused","confusing",df$comment)
df$comment <- gsub("convinced","convince",df$comment)
df$comment <- gsub("cuts","cut",df$comment)
df$comment <- gsub("damned","damn",df$comment)
df$comment <- gsub("dead|death","die",df$comment)
df$comment <- gsub("delighted","delight",df$comment)
df$comment <- gsub("desired","desire",df$comment)
df$comment <- gsub("destroyed","destroy",df$comment)
df$comment <- gsub("dirt","dirty",df$comment)
df$comment <- gsub("disappeared|disappears","disappear",df$comment)
df$comment <- gsub("disappointed|disappointing|disappointment","disappoint",df$comment)
df$comment <- gsub("discarding","discarded",df$comment)
df$comment <- gsub("doubted|doubtful|doubts","doubt",df$comment)
df$comment <- gsub("dreaded|dreading","dread",df$comment)
df$comment <- gsub("dream","dream",df$comment)
df$comment <- gsub("dumped","dump",df$comment)
df$comment <- gsub("elegantly","elegant",df$comment)
df$comment <- gsub("encouraged","encourage",df$comment)
df$comment <- gsub("enjoying|enjoys","enjoy",df$comment)
df$comment <- gsub("errors","error",df$comment)
df$comment <- gsub("escaping","escape",df$comment)
df$comment <- gsub("exciting","excited",df$comment)
df$comment <- gsub("exposing|exposed","expose",df$comment)
df$comment <- gsub("failed|fails","fail",df$comment)
df$comment <- gsub("failures","failure",df$comment)
df$comment <- gsub("favorites","favorite",df$comment)
df$comment <- gsub("fearful|fearing","fear",df$comment)
df$comment <- gsub("fired","fire",df$comment)
df$comment <- gsub("forgotten","forget",df$comment)
df$comment <- gsub("frustrated|frustrating","frustration",df$comment)
df$comment <- gsub("funny","fun",df$comment)
df$comment <- gsub("gained","gain",df$comment)
df$comment <- gsub("guilty","guilt",df$comment)
df$comment <- gsub("impressed","impress",df$comment)
df$comment <- gsub("improved","improve",df$comment)
df$comment <- gsub("increased","increase",df$comment)
df$comment <- gsub("intimidated|intimidating","intimidate",df$comment)
df$comment <- gsub("irritated|irritating","irritate",df$comment)
df$comment <- gsub("luckily|lucky","luck",df$comment)
df$comment <- gsub("matters","matter",df$comment)
df$comment <- gsub("missed|missing","miss",df$comment)
df$comment <- gsub("mistakes","mistake",df$comment)
df$comment <- gsub("nervously","nervous",df$comment)
df$comment <- gsub("perfectly","perfect",df$comment)
df$comment <- gsub("pleasant|pleased","pleasure",df$comment)
df$comment <- gsub("praised|praises|praising","praise",df$comment)
df$comment <- gsub("protected","protect	",df$comment)
df$comment <- gsub("questioning","questionable",df$comment)
df$comment <- gsub("recommended|recommends","recommend",df$comment)
df$comment <- gsub("regrets|regretted|regretting","regret",df$comment)
df$comment <- gsub("resolved|resolving","resolve",df$comment)
df$comment <- gsub("ruins|ruined","ruin",df$comment)
df$comment <- gsub("sadly","sad",df$comment)
df$comment <- gsub("safely|safety","safe",df$comment)
df$comment <- gsub("saved","save",df$comment)
df$comment <- gsub("scared","scare",df$comment)
df$comment <- gsub("shocked","shock",df$comment)
df$comment <- gsub("skeptic","skeptical",df$comment)
df$comment <- gsub("solved","solve",df$comment)
df$comment <- gsub("stopped","stop",df$comment)
df$comment <- gsub("strangely","strange",df$comment)
df$comment <- gsub("strongest","strong",df$comment)
df$comment <- gsub("struggled|struggles|struggling","struggle",df$comment)
df$comment <- gsub("stupidly","stupid",df$comment)
df$comment <- gsub("substantially","substantial",df$comment)
df$comment <- gsub("successful","success",df$comment)
df$comment <- gsub("sucks","suck",df$comment)
df$comment <- gsub("swears","swear",df$comment)
df$comment <- gsub("swiftly","swift",df$comment)
df$comment <- gsub("terribly","terrible",df$comment)
df$comment <- gsub("tops","top",df$comment)
df$comment <- gsub("trouble","troubles",df$comment)
df$comment <- gsub("trusted","trust",df$comment)
df$comment <- gsub("upsetting","upset",df$comment)
df$comment <- gsub("warned","warning",df$comment)
df$comment <- gsub("waste","wasted",df$comment)
df$comment <- gsub("wishing|wish","wish",df$comment)
df$comment <- gsub("worried","worry",df$comment)
df$comment <- gsub("worst","worse",df$comment)
df$comment <- gsub("worthy","worth",df$comment)
df$comment <- gsub("it's","",df$comment)
df$comment <- gsub("times","time",df$comment)
df$comment <- gsub("complaints","comlpaint",df$comment)
df$comment <- gsub("easier","easy",df$comment)
df$comment <- gsub("faster","fast",df$comment)
df$comment <- gsub("ething","eating",df$comment)
#감성제외한 단어카운트용
df$comment <- gsub("fryer|air|ve|tt","",df$comment)
df$comment <- gsub("cosori|tn|lo|ry|bought","",df$comment)
df$comment <- gsub("cooking|cooked|cooks","cook",df$comment)
df$comment <- gsub("lo","",df$comment)
library(tidytext)
library(dplyr)
#데이터 프레임 구성
text_df <- data_frame(rid=1:nrow(df),text=df$comment)
#단어들로 분리(토큰화)
tidy_text <- text_df %>% unnest_tokens(word,text,token = "ngrams", n = 1)
tidy_text <-tidy_text %>%
  filter(word != c("lo")) %>%
  filter(word != c("fer")) %>%
  filter(word != c("lile")) %>%
  filter(word != c("en")) %>%
  filter(word != c("ve")) %>%
  filter(word != c("ething")) %>%
  filter(word != c("ething")) %>%
  filter(word != c("cosori")) %>%
  filter(word != c("ppy")) %>%
  filter(word != c("wt"))
#stop word제거
data(stop_words) #불용어(stopword) 사전 가져오기
tidy_text <- tidy_text %>%
  anti_join(stop_words, by="word") #불용어 사전에 있는 단어 제거
#문서-단어 카운트 계산
word_counts <- tidy_text %>%
  count(rid, word, sort=TRUE)
library(topicmodels) #Topic modeling 패키지
#DocumentTermMatrix 형태로 변환
dtm <- word_counts %>%
  cast_dtm(rid, word, n)
dtm
#토픽 모델 만들기(토픽의 수 k로 조정)
lda <- LDA(dtm, k = 3, control = list(seed = 1234))
lda
#단어당 토픽 출현 확률
topics <- tidy(lda, matrix = "beta")
topics
library(ggplot2)
top_terms <- topics %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  ungroup() %>%
  arrange(topic, -beta)
top_terms %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  filter(term != "lo") %>%
  filter(term != "fer") %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ topic, scales = "free") +
  coord_flip() +
  scale_x_reordered()