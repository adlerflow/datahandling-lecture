library(shiny)
library(googlesheets4)
library(shinyjs)
library(DT)

# Authenticate with Google Sheets (run once interactively if needed)
# This line can be omitted if you've already authenticated using service accounts
gs4_auth(scopes = "https://www.googleapis.com/auth/spreadsheets", 
         path = "datahandlingform-e3748c92a518.json")
         # path = "C:/Users/aurel/OneDrive/Documents/DataHandling/datahandling-lecture2023/materials/app_firstlecture/DataHandlingIntro/datahandlingform-e3748c92a518.json")

# Define the Google Sheet URL (replace with your actual sheet URL)
sheet_url <- "https://docs.google.com/spreadsheets/d/13jZFfQHdqN5fI4PqGZZCvHGSgPbDPKBhdSmQ4WClyME/edit?gid=0#gid=0"


fieldsMandatory <- c("used_R", "literacy", "major")
humanTime <- function() format(Sys.time(), "%Y%m%d-%H%M%OS")

loadData <- function() {
  gs4_auth(scopes = "https://www.googleapis.com/auth/spreadsheets", 
           path = "datahandlingform-e3748c92a518.json")
           # path = "C:/Users/aurel/OneDrive/Documents/DataHandling/datahandling-lecture2023/materials/app_firstlecture/DataHandlingIntro/datahandlingform-e3748c92a518.json")
  ss <- sheet_url
  read_sheet(ss)
}

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

fieldsAll <- c("home_town", "used_R", "literacy", "major")
responsesDir <- file.path("responses")
epochTime <- function() {
  as.integer(Sys.time())
}

appCSS <- ".mandatory_star { color: red; }"

shinyApp(
  ui = fluidPage(
    shinyjs::useShinyjs(),
    shinyjs::inlineCSS(appCSS),
    titlePanel("Tell us about yourself!"),
    # DT::dataTableOutput("responsesTable"),
    # downloadButton("downloadBtn", "Download responses"),
    div(
      id = "form",
      textInput("home_town", labelMandatory("What do you consider to be your 'home town' (enter the home town in English)?")),
      sliderInput("literacy", "How would you describe your programming literacy from 1 (low) to 10 (expert)", 0, 10, 1, ticks = TRUE),
      checkboxInput("used_R", "I've used R before", FALSE),
      selectInput("major", "Which Major are you in?",
                  c("BWL", "VWL", "BIA", "BLaw", "BLE", "other")),
      actionButton("submit", "Submit", class = "btn-primary"),
      shinyjs::hidden(
        span(id = "submit_msg", "Submitting..."),
        div(id = "error",
            div(br(), tags$b("Error: "), span(id = "error_msg"))
        )
      )
    ),
    shinyjs::hidden(
      div(
        id = "thankyou_msg",
        h3("Thanks, your response was submitted successfully!"),
        actionLink("submit_another", "Submit another response")
      )
    )  
  ),
  server = function(input, output, session) {
    observe({
      mandatoryFilled <-
        vapply(fieldsMandatory,
               function(x) {
                 !is.null(input[[x]]) && input[[x]] != ""
               },
               logical(1))
      mandatoryFilled <- all(mandatoryFilled)
      
      shinyjs::toggleState(id = "submit", condition = mandatoryFilled)
    })    
    formData <- reactive({
      data <- sapply(fieldsAll, function(x) input[[x]])
      data <- c(data, timestamp = epochTime())
      data <- t(data)
      data
    })
    saveData <- function(data) {
      data <- data %>% as.list() %>% data.frame()
      gs4_auth(scopes = "https://www.googleapis.com/auth/spreadsheets", 
               path = "datahandlingform-e3748c92a518.json")
      ss <- sheet_url
      googlesheets4::sheet_append(ss, data = data, sheet = 1)
    }
    observeEvent(input$submit, {
      shinyjs::disable("submit")
      shinyjs::show("submit_msg")
      shinyjs::hide("error")
      
      tryCatch({
        saveData(formData())
        shinyjs::reset("form")
        shinyjs::hide("form")
        shinyjs::show("thankyou_msg")
      },
      error = function(err) {
        shinyjs::html("error_msg", err$message)
        shinyjs::show(id = "error", anim = TRUE, animType = "fade")
      },
      finally = {
        shinyjs::enable("submit")
        shinyjs::hide("submit_msg")
      })
    })
    observeEvent(input$submit_another, {
      shinyjs::show("form")
      shinyjs::hide("thankyou_msg")
    })   
    output$responsesTable <- DT::renderDataTable(
      loadData(),
      rownames = FALSE,
      options = list(searching = FALSE, lengthChange = FALSE)
    ) 
    output$downloadBtn <- downloadHandler(
      filename = function() { 
        sprintf("mimic-google-form_%s.csv", humanTime())
      },
      content = function(file) {
        write.csv(loadData(), file, row.names = FALSE)
      },
      contentType = "csv"
    )
  }
)
