library(shiny)

ui \<- fluidPage(
titlePanel("Guessing Game"),
sidebarLayout(
sidebarPanel(
numericInput("guess", "Enter your guess:", value = 50, min = 1, max = 100),
actionButton("submit", "Submit Guess")
),
mainPanel(
textOutput("feedback")
)
)
)

server \<- function(input, output, session) {

target \<- sample(1:100, 1)
feedbackText \<- reactiveVal("Guess a number between 1 and 100!")

observeEvent(input\$submit, {
guess \<- input\$guess
if (guess \< target) {
feedbackText("Too low! Try again.")
} else if (guess \> target) {
feedbackText("Too high! Try again.")
} else {
feedbackText(paste("Congratulations! You guessed the number", target))
}
})

output\$feedback \<- renderText({
feedbackText()
})
}

shinyApp(ui, server)
