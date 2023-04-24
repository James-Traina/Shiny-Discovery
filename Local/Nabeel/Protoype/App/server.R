#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    legend <- paste0("% of county with broadband in ", 2010)

        output$broadbandMap <- renderPlot({
            broadband <- switch(input$yearSlider - 2005, 
                                "2006" = broadband[broadband$year %in% c("2006"),]$broadband,
                                "2007" = broadband[broadband$year %in% c("2007"),]$broadband,
                                "2008" = broadband[broadband$year %in% c("2008"),]$broadband,
                                "2009" = broadband[broadband$year %in% c("2009"),]$broadband,
                                "2010" = broadband[broadband$year %in% c("2010"),]$broadband,
                                "2011" = broadband[broadband$year %in% c("2011"),]$broadband,
                                "2012" = broadband[broadband$year %in% c("2012"),]$broadband,
                                "2013" = broadband[broadband$year %in% c("2013"),]$broadband,
                                "2014" = broadband[broadband$year %in% c("2014"),]$broadband,
                                "2015" = broadband[broadband$year %in% c("2015"),]$broadband,
                                "2016" = broadband[broadband$year %in% c("2016"),]$broadband,
                                "2017" = broadband[broadband$year %in% c("2017"),]$broadband,
                                "2018" = broadband[broadband$year %in% c("2018"),]$broadband)
            
            percent_map(broadband, "red", legend, input$range[1], input$range[2])
        })
        
        output$tripsMap <- renderPlot({
            trip <- switch(input$tripYearSlider - 2005,
                           "2006" = trips[3]$c_trips_2006.RData$avg_trips,
                           "2007" = trips[4]$c_trips_2007.RData$avg_trips,
                           "2008" = trips[5]$c_trips_2008.RData$avg_trips,
                           "2009" = trips[6]$c_trips_2009.RData$avg_trips,
                           "2010" = trips[7]$c_trips_2010.RData$avg_trips,
                           "2011" = trips[8]$c_trips_2011.RData$avg_trips,
                           "2012" = trips[9]$c_trips_2012.RData$avg_trips,
                           "2013" = trips[10]$c_trips_2013.RData$avg_trips,
                           "2014" = trips[11]$c_trips_2014.RData$avg_trips,
                           "2015" = trips[12]$c_trips_2015.RData$avg_trips,
                           "2016" = trips[13]$c_trips_2016.RData$avg_trips,
                           "2017" = trips[14]$c_trips_2017.RData$avg_trips,
                           "2018" = trips[15]$c_trips_2018.RData$avg_trips,
            )
            
            trips_map(trip, "red", legend)
        })
        
        output$chainsMap <- renderPlot({
            chain <- switch(input$yearSlider - 2005,
                            "2006" = chains[3]$c_store_2006.RData$avg_store,
                            "2007" = chains[4]$c_store_2007.RData$avg_store,
                            "2008" = chains[5]$c_store_2008.RData$avg_store,
                            "2009" = chains[6]$c_store_2009.RData$avg_store,
                            "2010" = chains[7]$c_store_2010.RData$avg_store,
                            "2011" = chains[8]$c_store_2011.RData$avg_store,
                            "2012" = chains[9]$c_store_2012.RData$avg_store,
                            "2013" = chains[10]$c_store_2013.RData$avg_store,
                            "2014" = chains[11]$c_store_2014.RData$avg_store,
                            "2015" = chains[12]$c_store_2015.RData$avg_store,
                            "2016" = chains[13]$c_store_2016.RData$avg_store,
                            "2017" = chains[14]$c_store_2017.RData$avg_store,
                            "2018" = chains[15]$c_store_2018.RData$avg_store
            )
            
            stores_map(chain, "red", legend)
        })
        
        output$brandsMap <- renderPlot({
            brand <- switch(input$yearSlider - 2005,
                            "2006" = brands[3]$c_brand_2006.RData$avg_brand,
                            "2007" = brands[4]$c_brand_2007.RData$avg_brand,
                            "2008" = brands[5]$c_brand_2008.RData$avg_brand,
                            "2009" = brands[6]$c_brand_2009.RData$avg_brand,
                            "2010" = brands[7]$c_brand_2010.RData$avg_brand,
                            "2011" = brands[8]$c_brand_2011.RData$avg_brand,
                            "2012" = brands[9]$c_brand_2012.RData$avg_brand,
                            "2013" = brands[10]$c_brand_2013.RData$avg_brand,
                            "2014" = brands[11]$c_brand_2014.RData$avg_brand,
                            "2015" = brands[12]$c_brand_2015.RData$avg_brand,
                            "2016" = brands[13]$c_brand_2016.RData$avg_brand,
                            "2017" = brands[14]$c_brand_2017.RData$avg_brand,
                            "2018" = brands[15]$c_brand_2018.RData$avg_brand,
            )
            
            brands_map(brand, "red", legend)
        })
        
        output$plot <- renderPlot({
            years <- c(2006:2018)
            averages <- c(176.166, 173.4604, 174.5831, 172.9164, 168.987, 173.2001, 167.7919,
                          163.7684, 161.7133, 155.0277, 161.4032, 160.3225, 163.4159)
            df <-data.frame(years, averages)
            
            ggplot(data=df, aes(x=years, y=averages, group=1)) +
                geom_line()+
                ggtitle("Average Number of Trips per Year")+
                ylim(140,200)+
                geom_point(color="blue", size=3)
        })
        
        output$boxplots <- renderPlot({
            ggplot(data = broadband, aes(x=year, y=broadband)) + 
                geom_boxplot(aes(group = year))
        })
        output$tripsScatter <- renderPlot({
          broadband08 <- broadband[broadband$year %in% c("2008"),]
          broadbandTrips <- merge(broadband08, trips$c_trips_2008.RData, by.x = "county", by.y = "cfips")
          ggplot(broadbandTrips, aes(x=broadband, y=avg_trips)) + geom_point()
        })
        
        output$chainsScatter <- renderPlot({
          broadband08 <- broadband[broadband$year %in% c("2008"),]
          broadbandChains <- merge(broadband08, chains$c_store_2008.RData, by.x = "county", by.y = "cfips")
          ggplot(broadbandChains, aes(x=broadband, y=avg_store)) + geom_point()
        })
        
        output$brandsScatter <- renderPlot({
          broadband08 <- broadband[broadband$year %in% c("2008"),]
          broadbandBrands <- merge(broadband08, brands$c_brand_2008.RData, by.x = "county", by.y = "cfips")
          ggplot(broadbandBrands, aes(x=broadband, y=avg_brand)) + geom_point()
        })
    })






