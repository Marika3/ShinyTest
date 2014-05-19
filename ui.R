require(shiny)
require(rCharts)

shinyUI(
    fluidPage(
 
## Centered top panel        
    titlePanel(h1("Interactive mapping with rCharts and Shiny", align = "center")),

## Side panel with selection widget and explanation text    
    sidebarPanel(
          selectInput("decile", h5(p("Select decile to see schools on map."),
                                    p("Zoom map to suit."),
                                   p("Click on popups to see school names"), align = "center"), 1:10),
          helpText("Deciles are a way in which New Zealand Ministry of Education allocates 
                    funding to schools.
                    A school's decile rating indicates the extent to which 
                    it draws its students from low socio-economic communities. 
                    Decile 1 schools are the 10% of schools with the highest proportion of students 
                    from low socio-economic communities, whereas decile 10 schools are the 10% 
                    of schools with the lowest proportion of these students.
                    The lower a school's decile rating, the more funding it gets to provide 
                    additional resources to support their students' learning needs." )
          ),

## main panel for map plotting    
    mainPanel(
        mapOutput('myMap'))
         )
    )
