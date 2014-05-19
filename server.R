library(shiny)
library(rCharts)

## Reading data for Aucland schools, including names, decile and coordinates

AucklandSchools <- read.csv("AuckSch.csv", header = TRUE, strip.white = TRUE)

shinyServer(
    function(input, output){
        output$myMap <- renderMap ({

## Create map container
        mapT <- Leaflet$new()

## Set screen size for map
        mapT$set(width = 800, height = 400)

## Set map center at most central city school and zoom
        mapT$setView(c(AucklandSchools$Latitude[507],AucklandSchools$Longitude[507]), zoom = 12)

## Subset schools for selected decile
        Selected <- subset(AucklandSchools, AucklandSchools$Decile == input$decile, rownames=FALSE)
        
## Create name pop-ups for each of selected schools
        for (i in 1:nrow(Selected))
            mapT$marker(c(Selected$Latitude[i], Selected$Longitude[i]), 
                        bindPopup = Selected$Name[i])
        return(mapT)
    })
})
