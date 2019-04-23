library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

fluidPage(
  titlePanel("Vendas online"),
  fluidRow(
    column(3,
      wellPanel(
        h4("Filtro"),
        sliderInput("reviews", "Numero minimo de quantidade do produto comprada",
          1, 9, 80, step = 1),
        sliderInput("year", "Data", 1940, 2014, value = c(1970, 2014),
          sep = ""),
        sliderInput("oscars", "Minimo custo de envio",
          0, 80, 0, step = 1),
        sliderInput("boxoffice", "Lucro obtido",
          0, 92, c(0, 92), step = 1),
        selectInput("genre", "Prioridade na encomenda",
          c("All", "Medium", "High", "Critical")
        ),
        textInput("director", "Director name contains (e.g., Miyazaki)"),
        textInput("cast", "Cast names contains (e.g. Tom Hanks)")
      ),
      wellPanel(
        selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
        selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews"),
        tags$small(paste0())
      )
    ),
    column(9,
      ggvisOutput("plot1"),
      wellPanel(
        span("Number of movies selected:",
          textOutput("n_movies")
        )
      )
    )
  )
)
