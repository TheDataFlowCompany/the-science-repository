library(shiny)
library(here)

mock_data <- readr::read_csv(here::here("data", "mock", "consumer_data.csv"),
                             show_col_types = FALSE)

ui <- fluidPage(
  titlePanel("The Science Repository — example app"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("age_range", "Age range:",
                  min = 18, max = 80, value = c(25, 65))
    ),
    mainPanel(
      plotOutput("score_hist"),
      tableOutput("summary")
    )
  )
)

server <- function(input, output, session) {
  filtered <- reactive({
    subset(mock_data, age >= input$age_range[1] & age <= input$age_range[2])
  })

  output$score_hist <- renderPlot({
    hist(filtered()$score, main = NULL, xlab = "Score", col = "grey80", border = "white")
  })

  output$summary <- renderTable({
    data.frame(
      n          = nrow(filtered()),
      mean_score = round(mean(filtered()$score, na.rm = TRUE), 2),
      sd_score   = round(sd(filtered()$score, na.rm = TRUE), 2)
    )
  })
}

shinyApp(ui, server)
