## Reading sample
US_files <- system.file("./model_samples/sample",package="readtext")
US_EN<- as.data.table(readtext(paste0(US_files,"./model_samples/sample/*.*"),
                               encoding="UTF-8"))

### Tidy format - tokenising
US.Token.table.Bi <- US_EN %>%
  unnest_tokens(ngram, text, token = "ngrams",to_lower = TRUE, n= 2) %>%
  separate(ngram, c("word1", "word2"), sep = " ") %>%
  count(word1, word2, sort = TRUE)

US.Token.table.Tri <- US_EN %>%
  unnest_tokens(ngram, text, token = "ngrams",to_lower = TRUE, n= 3) %>%
  separate(ngram, c("word1", "word2", "word3"), sep = " ") %>%
  count(word1, word2, word3, sort = TRUE)

US.Token.table.Quad <- US_EN %>%
  unnest_tokens(ngram, text, token = "ngrams",to_lower = TRUE, n= 4) %>%
  separate(ngram, c("word1", "word2", "word3","word4"), sep = " ") %>%
  count(word1, word2, word3, word4,sort = TRUE)

US.Token.table.Cinq <- US_EN %>%
  unnest_tokens(ngram, text, token = "ngrams",to_lower = TRUE, n= 5) %>%
  separate(ngram, c("word1", "word2", "word3","word4","word5"), sep = " ") %>%
  count(word1, word2, word3, word4,word5,sort = TRUE)