tabPanelAbout <- source("external/about.R",local=T)$value
headerPanel_2 <- function(title, h, windowTitle=title) {    
  tagList(
    tags$head(tags$title(windowTitle)),
      h(title)
    )
}

shinyUI(fluidPage(
	source("external/header.R",local=T)$value,
	fluidRow(
		source("external/sidebar.R",local=T)$value,
		source("external/main.R",local=T)$value
	)
))
