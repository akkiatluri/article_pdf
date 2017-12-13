gutenberg_works(str_detect(title,'The Adventure'))

sherlock<-gutenberg_download(1661)

sherlock_words<-sherlock%>%
  unnest_tokens(word,text)

sherlock_words<-sherlock_words%>%
  filter(!(word %in% stop_words$word))

sherlock_freq<-sherlock_words%>%
  group_by(word)%>%
  summarize(count=n())

wordcloud(sherlock_freq$word,sherlock_freq$count,min.freq = 25)