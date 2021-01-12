library(shiny)
library(tidytext)
library(dplyr)
library(readtext)
library(tidyr)
library(data.table)
library(gsheet)


# Define server logic required to predict the next word
shinyServer(function(input, output) {
  
  clean_sentence <- reactive ({
    
      clean<- input$inputtext %>%
        tolower()
      clean<- gsub("[[:punct:]]+","",clean)
      clean1<- unlist(strsplit(clean," "))
      Words<- clean1[c((length(clean1)-2), (length(clean1)-1), (length(clean1)))]
      Words
      })
  output$Words <- renderText({clean_sentence()
    })
  
  ## Obtaining tokens
  ngram3_url<- "https://docs.google.com/spreadsheets/d/1jmt0UXyGiGAhUGRL7v7b_C3ZHytiE3iGoGHhqbC_Xl0/edit?usp=sharing"
  ngram2_url<- "https://docs.google.com/spreadsheets/d/1Rv54TRptWdyy_mKM0CSDwqrfreoPmW3txC6YVOrAjBk/edit?usp=sharing"
  ngram4_url<- "https://docs.google.com/spreadsheets/d/1gVB_TbdyLe3Ec673oHUUHDB98qB0oa9Bdk1vtgqIACw/edit?usp=sharing"
  ngram5_url<- "https://docs.google.com/spreadsheets/d/1qfJ0b748HWrYdZS5UtN_6PzK4vrGPvFohrsaHf6pXi0/edit?usp=sharing"
  
  ngram2<- gsheet2tbl(ngram2_url)
  ngram3<- gsheet2tbl(ngram3_url)
  ngram4<- gsheet2tbl(ngram4_url)
 
    return_word <- function (x) {
    
      Word <- ngram4 %>%
      filter(word1==x[1], word2==x[2], word3==x[3]) %>%
      slice_head() %>%
      .[["word4"]]
      
      if(length(Word) == 0){
        alternative <- ngram3%>% 
        filter(word1==x[2], word2==x[3]) %>%
        slice_head() %>%
        .[["word3"]]
        Word <- alternative
        
        if(length(Word) == 0){
          alternative1 <- ngram2 %>% 
          filter(word1==x[3]) %>%
          slice_head() %>%
          .[["word2"]]
          Word <- alternative1
          
          if(length(Word) == 0){
            alternative2 <- "No Word Found"
            Word<- alternative2}}}
      Word}
    
  output$Prediction <- renderText({return_word(clean_sentence())
  })
})