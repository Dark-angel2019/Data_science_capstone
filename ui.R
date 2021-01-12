## Defining user interface

shinyUI(fluidPage(
    titlePanel("Predicting the next word"),
    sidebarLayout(
        sidebarPanel(
            textInput("inputtext", "Please insert the preceding texts"),
            em("Please make sure the word to be predicted is not included as input."),
            h5("At least 3 words should be entered"),
            submitButton("Submit")),

        mainPanel(
            h3("Words"),
            verbatimTextOutput("Words", placeholder = TRUE),
            h3("Prediction"),
            verbatimTextOutput("Prediction", placeholder = TRUE)
        )),
    
    tabPanel(
        "User Information",
        br(),
        h3("NOTE"),
        h4(
            "The app will take approximately 1min - 1min30 to produce the first answer (instant thereafter). Please be patient."),
        br(),
        h3("Introduction"),
        p(
            "The purpose of this app is to predict the next word in a sentence after a User has entered at least 4 of the preceding words."),
        p(
            "The source data of the app is downloaded from https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"),
        p(
            "The source data consists of large amounts of texts extracted from blogs, news and twitter in 4 languagues. The relevant files in English are almost 600mb in size"),
        p(
            "The model is built based on a sample dataset which consists of randomly selected 2% of the total set."),
        p(
            "The author has decided not to clean up the data other than removing punctuations because profanity and type are part of daily lives now."),
        br(),
        h3("How to use this application"),
        p(
            "This is a simple an intuitive app."),
        p(
            "Users can simply insert any sentence with the word to be predicted missing."),
        p(
            "The app will the produce a single prediction based on the input provided."),
        p(
            "Details of how the app is designed and operates can be found on https://rpubs.com/flying_caterpilla/712548.")
)))



