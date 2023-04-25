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
            broadbandLegend <- paste0("% of county with broadband in ", input$yearSlider)
            percent_map(broadband, "blue", broadbandLegend)
        })
        
        output$tripsBroadbandMap <- renderPlot({
          broadband <- switch(input$tripYearSlider - 2005, 
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
          broadbandLegend <- paste0("% of county with broadband in ", input$tripYearSlider)
          percent_map(broadband, "blue", broadbandLegend)
        })
        
        output$chainsBroadbandMap <- renderPlot({
          broadband <- switch(input$chainYearSlider - 2005, 
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
          broadbandLegend <- paste0("% of county with broadband in ", input$chainYearSlider)
          percent_map(broadband, "blue", broadbandLegend)
        })
        
        output$brandsBroadbandMap <- renderPlot({
          broadband <- switch(input$brandsYearSlider - 2005, 
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
          broadbandLegend <- paste0("% of county with broadband in ", input$brandsYearSlider)
          percent_map(broadband, "blue", broadbandLegend)
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
            tripsLegend <- paste0("Avg number of Trips per County ", input$tripYearSlider)
            trips_map(trip, "blue", tripsLegend)
            
        })
        
            
        output$chainsMap <- renderPlot({
            chain <- switch(input$chainYearSlider - 2005,
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
            chainsLegend <- paste0("Avg number of Chains Visited per County ", input$chainYearSlider)
            stores_map(chain, "blue", chainsLegend)
            
        })
        
        output$brandsMap <- renderPlot({
            brand <- switch(input$brandsYearSlider - 2005,
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
            brandsLegend <- paste0("Avg number of Brands Purchased per County ", input$brandsYearSlider)
            brands_map(brand, "blue", brandsLegend)
        })
      
        output$tripLinePlot <- renderPlot({
          years <- c(2006:2018)
          
          
          #2006 to 2018
          #2006
          p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .10)
          p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .10)
          p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .10)
          p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .10)
          p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .10)
          p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .10)
          p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .10)
          p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .10)
          p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .10)
          p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .10)
          p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .10)
          p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .10)
          p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .10)
          p10 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .25)
          p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .25)
          p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .25)
          p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .25)
          p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .25)
          p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .25)
          p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .25)
          p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .25)
          p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .25)
          p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .25)
          p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .25)
          p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .25)
          p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .25)
          p25 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .50)
          p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .50)
          p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .50)
          p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .50)
          p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .50)
          p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .50)
          p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .50)
          p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .50)
          p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .50)
          p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .50)
          p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .50)
          p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .50)
          p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .50)
          p50 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .75)
          p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .75)
          p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .75)
          p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .75)
          p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .75)
          p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .75)
          p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .75)
          p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .75)
          p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .75)
          p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .75)
          p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .75)
          p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .75)
          p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .75)
          p75 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(trips$c_trips_2006.RData$avg_trips, .90)
          p2007 <- quantile(trips$c_trips_2007.RData$avg_trips, .90)
          p2008 <- quantile(trips$c_trips_2008.RData$avg_trips, .90)
          p2009 <- quantile(trips$c_trips_2009.RData$avg_trips, .90)
          p2010 <- quantile(trips$c_trips_2010.RData$avg_trips, .90)
          p2011 <- quantile(trips$c_trips_2011.RData$avg_trips, .90)
          p2012 <- quantile(trips$c_trips_2012.RData$avg_trips, .90)
          p2013 <- quantile(trips$c_trips_2013.RData$avg_trips, .90)
          p2014 <- quantile(trips$c_trips_2014.RData$avg_trips, .90)
          p2015 <- quantile(trips$c_trips_2015.RData$avg_trips, .90)
          p2016 <- quantile(trips$c_trips_2016.RData$avg_trips, .90)
          p2017 <- quantile(trips$c_trips_2017.RData$avg_trips, .90)
          p2018 <- quantile(trips$c_trips_2018.RData$avg_trips, .90)
          p90 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          df <- data.frame(years, p10, p25, p50, p75, p90)
          
          
          ggplot(data=df, aes(x=years, y=p10)) +
            geom_line()+
            ggtitle("Average Number of Trips per Year")+
            ylim(140,200)+
            geom_point(color="blue", size=3)
          
          
          
          ggplot(df, aes(x=years)) + 
            geom_line(aes(y = p10, color = "p10", group = 1L)) +
            geom_line(aes(y = p25, color = "p25", group = 1L)) +
            geom_line(aes(y = p50, color = "p50", group = 1L)) +
            geom_line(aes(y = p75, color = "p75", group = 1L)) +
            geom_line(aes(y = p90, color = "p90", group = 1L)) +
            aes(color = 1L) +
            ggtitle("Time Trends in Trips") +
            ylab("Average Number of Trips")
        })
        
        output$tripPlot <- renderPlot({
          years <- c(2006:2018)
          averages <- c(176.166, 173.4604, 174.5831, 172.9164, 168.987, 173.2001, 167.7919,
                        163.7684, 161.7133, 155.0277, 161.4032, 160.3225, 163.4159)
          df <-data.frame(years, averages)
          
          ggplot(data=df, aes(x=years, y=averages, color=years, group=1)) +
            geom_line()+
            ggtitle("Average Number of Trips per Year")+
            ylim(140,200)+
            geom_point(color="blue", size=3)
        })
        
        output$boxplots <- renderPlot({
            ggplot(data = broadband, aes(x=year, y=broadband, color=year, fill=year)) + 
                geom_boxplot(aes(group = year)) + ggtitle("Broadband Over The Years") +
            xlab("Years") + ylab("Broadband")
        })
        output$tripsScatter <- renderPlot({
          
          trip <- switch(input$tripYearSlider - 2005,
                         "2006" = trips[3]$c_trips_2006.RData,
                         "2007" = trips[4]$c_trips_2007.RData,
                         "2008" = trips[5]$c_trips_2008.RData,
                         "2009" = trips[6]$c_trips_2009.RData,
                         "2010" = trips[7]$c_trips_2010.RData,
                         "2011" = trips[8]$c_trips_2011.RData,
                         "2012" = trips[9]$c_trips_2012.RData,
                         "2013" = trips[10]$c_trips_2013.RData,
                         "2014" = trips[11]$c_trips_2014.RData,
                         "2015" = trips[12]$c_trips_2015.RData,
                         "2016" = trips[13]$c_trips_2016.RData,
                         "2017" = trips[14]$c_trips_2017.RData,
                         "2018" = trips[15]$c_trips_2018.RData
          )
          
          broadband <- switch(input$tripYearSlider - 2005, 
                              
                        "2006" = broadband[broadband$year %in% c("2006"),],
                        "2007" = broadband[broadband$year %in% c("2007"),],
                        "2008" = broadband[broadband$year %in% c("2008"),],
                        "2009" = broadband[broadband$year %in% c("2009"),],
                        "2010" = broadband[broadband$year %in% c("2010"),],
                        "2011" = broadband[broadband$year %in% c("2011"),],
                        "2012" = broadband[broadband$year %in% c("2012"),],
                        "2013" = broadband[broadband$year %in% c("2013"),],
                        "2014" = broadband[broadband$year %in% c("2014"),],
                        "2015" = broadband[broadband$year %in% c("2015"),],
                        "2016" = broadband[broadband$year %in% c("2016"),],
                        "2017" = broadband[broadband$year %in% c("2017"),],
                        "2018" = broadband[broadband$year %in% c("2018"),]
                      )

          broadbandTrips <- merge(broadband, trip, by.x = "county", by.y = "cfips")
          ggplot(broadbandTrips, aes(x=broadband, y=avg_trips, color=broadband)) + geom_point() +
            ggtitle("Broadband vs. Unique Brands Purchased") + ylab("Brands") + xlab("Broadband")
        })
        
        
        
        output$chainsScatter <- renderPlot({
          
          broadband <- switch(input$tripYearSlider - 2005, 
                              
                              "2006" = broadband[broadband$year %in% c("2006"),],
                              "2007" = broadband[broadband$year %in% c("2007"),],
                              "2008" = broadband[broadband$year %in% c("2008"),],
                              "2009" = broadband[broadband$year %in% c("2009"),],
                              "2010" = broadband[broadband$year %in% c("2010"),],
                              "2011" = broadband[broadband$year %in% c("2011"),],
                              "2012" = broadband[broadband$year %in% c("2012"),],
                              "2013" = broadband[broadband$year %in% c("2013"),],
                              "2014" = broadband[broadband$year %in% c("2014"),],
                              "2015" = broadband[broadband$year %in% c("2015"),],
                              "2016" = broadband[broadband$year %in% c("2016"),],
                              "2017" = broadband[broadband$year %in% c("2017"),],
                              "2018" = broadband[broadband$year %in% c("2018"),]
          )
          
          chain <- switch(input$chainYearSlider - 2005,
                          "2006" = chains[3]$c_store_2006.RData,
                          "2007" = chains[4]$c_store_2007.RData,
                          "2008" = chains[5]$c_store_2008.RData,
                          "2009" = chains[6]$c_store_2009.RData,
                          "2010" = chains[7]$c_store_2010.RData,
                          "2011" = chains[8]$c_store_2011.RData,
                          "2012" = chains[9]$c_store_2012.RData,
                          "2013" = chains[10]$c_store_2013.RData,
                          "2014" = chains[11]$c_store_2014.RData,
                          "2015" = chains[12]$c_store_2015.RData,
                          "2016" = chains[13]$c_store_2016.RData,
                          "2017" = chains[14]$c_store_2017.RData,
                          "2018" = chains[15]$c_store_2018.RData
          )
          
          broadbandChains <- merge(broadband, chain, by.x = "county", by.y = "cfips")
          ggplot(broadbandChains, aes(x=broadband, y=avg_store, color=broadband)) + geom_point() +
            ggtitle("Broadband vs. Unique Chains Visited") + xlab("Broadband") + ylab("Chains")
        })
        
        output$brandsScatter <- renderPlot({
          
          broadband <- switch(input$tripYearSlider - 2005, 
                              
                              "2006" = broadband[broadband$year %in% c("2006"),],
                              "2007" = broadband[broadband$year %in% c("2007"),],
                              "2008" = broadband[broadband$year %in% c("2008"),],
                              "2009" = broadband[broadband$year %in% c("2009"),],
                              "2010" = broadband[broadband$year %in% c("2010"),],
                              "2011" = broadband[broadband$year %in% c("2011"),],
                              "2012" = broadband[broadband$year %in% c("2012"),],
                              "2013" = broadband[broadband$year %in% c("2013"),],
                              "2014" = broadband[broadband$year %in% c("2014"),],
                              "2015" = broadband[broadband$year %in% c("2015"),],
                              "2016" = broadband[broadband$year %in% c("2016"),],
                              "2017" = broadband[broadband$year %in% c("2017"),],
                              "2018" = broadband[broadband$year %in% c("2018"),]
          )
          
          brand <- switch(input$brandsYearSlider - 2005,
                          "2006" = brands[3]$c_brand_2006.RData,
                          "2007" = brands[4]$c_brand_2007.RData,
                          "2008" = brands[5]$c_brand_2008.RData,
                          "2009" = brands[6]$c_brand_2009.RData,
                          "2010" = brands[7]$c_brand_2010.RData,
                          "2011" = brands[8]$c_brand_2011.RData,
                          "2012" = brands[9]$c_brand_2012.RData,
                          "2013" = brands[10]$c_brand_2013.RData,
                          "2014" = brands[11]$c_brand_2014.RData,
                          "2015" = brands[12]$c_brand_2015.RData,
                          "2016" = brands[13]$c_brand_2016.RData,
                          "2017" = brands[14]$c_brand_2017.RData,
                          "2018" = brands[15]$c_brand_2018.RData,
          )
          
          broadbandBrand <- merge(broadband, brand, by.x = "county", by.y = "cfips")
          ggplot(broadbandBrand, aes(x=broadband, y=avg_brand, color=broadband)) + geom_point() +
            ggtitle("Broadband vs. Unique Brands Purchased") + ylab("Brands") + xlab("Broadband")
        })
        
        
        
        output$chainLinePlot <- renderPlot({
          
          broadband <- switch(input$tripYearSlider - 2005, 
                              
                              "2006" = broadband[broadband$year %in% c("2006"),],
                              "2007" = broadband[broadband$year %in% c("2007"),],
                              "2008" = broadband[broadband$year %in% c("2008"),],
                              "2009" = broadband[broadband$year %in% c("2009"),],
                              "2010" = broadband[broadband$year %in% c("2010"),],
                              "2011" = broadband[broadband$year %in% c("2011"),],
                              "2012" = broadband[broadband$year %in% c("2012"),],
                              "2013" = broadband[broadband$year %in% c("2013"),],
                              "2014" = broadband[broadband$year %in% c("2014"),],
                              "2015" = broadband[broadband$year %in% c("2015"),],
                              "2016" = broadband[broadband$year %in% c("2016"),],
                              "2017" = broadband[broadband$year %in% c("2017"),],
                              "2018" = broadband[broadband$year %in% c("2018"),]
          )
          
          brand <- switch(input$brandsYearSlider - 2005,
                          "2006" = brands[3]$c_brand_2006.RData,
                          "2007" = brands[4]$c_brand_2007.RData,
                          "2008" = brands[5]$c_brand_2008.RData,
                          "2009" = brands[6]$c_brand_2009.RData,
                          "2010" = brands[7]$c_brand_2010.RData,
                          "2011" = brands[8]$c_brand_2011.RData,
                          "2012" = brands[9]$c_brand_2012.RData,
                          "2013" = brands[10]$c_brand_2013.RData,
                          "2014" = brands[11]$c_brand_2014.RData,
                          "2015" = brands[12]$c_brand_2015.RData,
                          "2016" = brands[13]$c_brand_2016.RData,
                          "2017" = brands[14]$c_brand_2017.RData,
                          "2018" = brands[15]$c_brand_2018.RData, 
          )
          
          broadbandBrands <- merge(broadband, brand, by.x = "county", by.y = "cfips")
          ggplot(broadbandBrands, aes(x=broadband, y=avg_brand, color=broadband)) + geom_point()
        })
        
        output$chainLinePlot <- renderPlot({
          p2006 <- quantile(chains$c_store_2006.RData$avg_store, .10)
          p2007 <- quantile(chains$c_store_2007.RData$avg_store, .10)
          p2008 <- quantile(chains$c_store_2008.RData$avg_store, .10)
          p2009 <- quantile(chains$c_store_2009.RData$avg_store, .10)
          p2010 <- quantile(chains$c_store_2010.RData$avg_store, .10)
          p2011 <- quantile(chains$c_store_2011.RData$avg_store, .10)
          p2012 <- quantile(chains$c_store_2012.RData$avg_store, .10)
          p2013 <- quantile(chains$c_store_2013.RData$avg_store, .10)
          p2014 <- quantile(chains$c_store_2014.RData$avg_store, .10)
          p2015 <- quantile(chains$c_store_2015.RData$avg_store, .10)
          p2016 <- quantile(chains$c_store_2016.RData$avg_store, .10)
          p2017 <- quantile(chains$c_store_2017.RData$avg_store, .10)
          p2018 <- quantile(chains$c_store_2018.RData$avg_store, .10)
          p10 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(chains$c_store_2006.RData$avg_store, .25)
          p2007 <- quantile(chains$c_store_2007.RData$avg_store, .25)
          p2008 <- quantile(chains$c_store_2008.RData$avg_store, .25)
          p2009 <- quantile(chains$c_store_2009.RData$avg_store, .25)
          p2010 <- quantile(chains$c_store_2010.RData$avg_store, .25)
          p2011 <- quantile(chains$c_store_2011.RData$avg_store, .25)
          p2012 <- quantile(chains$c_store_2012.RData$avg_store, .25)
          p2013 <- quantile(chains$c_store_2013.RData$avg_store, .25)
          p2014 <- quantile(chains$c_store_2014.RData$avg_store, .25)
          p2015 <- quantile(chains$c_store_2015.RData$avg_store, .25)
          p2016 <- quantile(chains$c_store_2016.RData$avg_store, .25)
          p2017 <- quantile(chains$c_store_2017.RData$avg_store, .25)
          p2018 <- quantile(chains$c_store_2018.RData$avg_store, .25)
          p25 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(chains$c_store_2006.RData$avg_store, .50)
          p2007 <- quantile(chains$c_store_2007.RData$avg_store, .50)
          p2008 <- quantile(chains$c_store_2008.RData$avg_store, .50)
          p2009 <- quantile(chains$c_store_2009.RData$avg_store, .50)
          p2010 <- quantile(chains$c_store_2010.RData$avg_store, .50)
          p2011 <- quantile(chains$c_store_2011.RData$avg_store, .50)
          p2012 <- quantile(chains$c_store_2012.RData$avg_store, .50)
          p2013 <- quantile(chains$c_store_2013.RData$avg_store, .50)
          p2014 <- quantile(chains$c_store_2014.RData$avg_store, .50)
          p2015 <- quantile(chains$c_store_2015.RData$avg_store, .50)
          p2016 <- quantile(chains$c_store_2016.RData$avg_store, .50)
          p2017 <- quantile(chains$c_store_2017.RData$avg_store, .50)
          p2018 <- quantile(chains$c_store_2018.RData$avg_store, .50)
          p50 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(chains$c_store_2006.RData$avg_store, .75)
          p2007 <- quantile(chains$c_store_2007.RData$avg_store, .75)
          p2008 <- quantile(chains$c_store_2008.RData$avg_store, .75)
          p2009 <- quantile(chains$c_store_2009.RData$avg_store, .75)
          p2010 <- quantile(chains$c_store_2010.RData$avg_store, .75)
          p2011 <- quantile(chains$c_store_2011.RData$avg_store, .75)
          p2012 <- quantile(chains$c_store_2012.RData$avg_store, .75)
          p2013 <- quantile(chains$c_store_2013.RData$avg_store, .75)
          p2014 <- quantile(chains$c_store_2014.RData$avg_store, .75)
          p2015 <- quantile(chains$c_store_2015.RData$avg_store, .75)
          p2016 <- quantile(chains$c_store_2016.RData$avg_store, .75)
          p2017 <- quantile(chains$c_store_2017.RData$avg_store, .75)
          p2018 <- quantile(chains$c_store_2018.RData$avg_store, .75)
          p75 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(chains$c_store_2006.RData$avg_store, .90)
          p2007 <- quantile(chains$c_store_2007.RData$avg_store, .90)
          p2008 <- quantile(chains$c_store_2008.RData$avg_store, .90)
          p2009 <- quantile(chains$c_store_2009.RData$avg_store, .90)
          p2010 <- quantile(chains$c_store_2010.RData$avg_store, .90)
          p2011 <- quantile(chains$c_store_2011.RData$avg_store, .90)
          p2012 <- quantile(chains$c_store_2012.RData$avg_store, .90)
          p2013 <- quantile(chains$c_store_2013.RData$avg_store, .90)
          p2014 <- quantile(chains$c_store_2014.RData$avg_store, .90)
          p2015 <- quantile(chains$c_store_2015.RData$avg_store, .90)
          p2016 <- quantile(chains$c_store_2016.RData$avg_store, .90)
          p2017 <- quantile(chains$c_store_2017.RData$avg_store, .90)
          p2018 <- quantile(chains$c_store_2018.RData$avg_store, .90)
          p90 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          df <- data.frame(years, p10, p25, p50, p75, p90)
          
          ggplot(df, aes(x=years)) + 
            geom_line(aes(y = p10, color = "p10", group = 1L)) +
            geom_line(aes(y = p25, color = "p25", group = 1L)) +
            geom_line(aes(y = p50, color = "p50", group = 1L)) +
            geom_line(aes(y = p75, color = "p75", group = 1L)) +
            geom_line(aes(y = p90, color = "p90", group = 1L)) +
            aes(color = 1L) +
            ggtitle("Time Trends in Unique Chains Visited") +
            ylab(" Number of Unique Chains Visited")
        })
        
        output$brandLinePlot <- renderPlot({
          
          p2006 <- quantile(brands$c_brand_2006.RData$avg_brand, .10)
          p2007 <- quantile(brands$c_brand_2007.RData$avg_brand, .10)
          p2008 <- quantile(brands$c_brand_2008.RData$avg_brand, .10)
          p2009 <- quantile(brands$c_brand_2009.RData$avg_brand, .10)
          p2010 <- quantile(brands$c_brand_2010.RData$avg_brand, .10)
          p2011 <- quantile(brands$c_brand_2011.RData$avg_brand, .10)
          p2012 <- quantile(brands$c_brand_2012.RData$avg_brand, .10)
          p2013 <- quantile(brands$c_brand_2013.RData$avg_brand, .10)
          p2014 <- quantile(brands$c_brand_2014.RData$avg_brand, .10)
          p2015 <- quantile(brands$c_brand_2015.RData$avg_brand, .10)
          p2016 <- quantile(brands$c_brand_2016.RData$avg_brand, .10)
          p2017 <- quantile(brands$c_brand_2017.RData$avg_brand, .10)
          p2018 <- quantile(brands$c_brand_2018.RData$avg_brand, .10)
          p10 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(brands$c_brand_2006.RData$avg_brand, .25)
          p2007 <- quantile(brands$c_brand_2007.RData$avg_brand, .25)
          p2008 <- quantile(brands$c_brand_2008.RData$avg_brand, .25)
          p2009 <- quantile(brands$c_brand_2009.RData$avg_brand, .25)
          p2010 <- quantile(brands$c_brand_2010.RData$avg_brand, .25)
          p2011 <- quantile(brands$c_brand_2011.RData$avg_brand, .25)
          p2012 <- quantile(brands$c_brand_2012.RData$avg_brand, .25)
          p2013 <- quantile(brands$c_brand_2013.RData$avg_brand, .25)
          p2014 <- quantile(brands$c_brand_2014.RData$avg_brand, .25)
          p2015 <- quantile(brands$c_brand_2015.RData$avg_brand, .25)
          p2016 <- quantile(brands$c_brand_2016.RData$avg_brand, .25)
          p2017 <- quantile(brands$c_brand_2017.RData$avg_brand, .25)
          p2018 <- quantile(brands$c_brand_2018.RData$avg_brand, .25)
          p25 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(brands$c_brand_2006.RData$avg_brand, .50)
          p2007 <- quantile(brands$c_brand_2007.RData$avg_brand, .50)
          p2008 <- quantile(brands$c_brand_2008.RData$avg_brand, .50)
          p2009 <- quantile(brands$c_brand_2009.RData$avg_brand, .50)
          p2010 <- quantile(brands$c_brand_2010.RData$avg_brand, .50)
          p2011 <- quantile(brands$c_brand_2011.RData$avg_brand, .50)
          p2012 <- quantile(brands$c_brand_2012.RData$avg_brand, .50)
          p2013 <- quantile(brands$c_brand_2013.RData$avg_brand, .50)
          p2014 <- quantile(brands$c_brand_2014.RData$avg_brand, .50)
          p2015 <- quantile(brands$c_brand_2015.RData$avg_brand, .50)
          p2016 <- quantile(brands$c_brand_2016.RData$avg_brand, .50)
          p2017 <- quantile(brands$c_brand_2017.RData$avg_brand, .50)
          p2018 <- quantile(brands$c_brand_2018.RData$avg_brand, .50)
          p50 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(brands$c_brand_2006.RData$avg_brand, .75)
          p2007 <- quantile(brands$c_brand_2007.RData$avg_brand, .75)
          p2008 <- quantile(brands$c_brand_2008.RData$avg_brand, .75)
          p2009 <- quantile(brands$c_brand_2009.RData$avg_brand, .75)
          p2010 <- quantile(brands$c_brand_2010.RData$avg_brand, .75)
          p2011 <- quantile(brands$c_brand_2011.RData$avg_brand, .75)
          p2012 <- quantile(brands$c_brand_2012.RData$avg_brand, .75)
          p2013 <- quantile(brands$c_brand_2013.RData$avg_brand, .75)
          p2014 <- quantile(brands$c_brand_2014.RData$avg_brand, .75)
          p2015 <- quantile(brands$c_brand_2015.RData$avg_brand, .75)
          p2016 <- quantile(brands$c_brand_2016.RData$avg_brand, .75)
          p2017 <- quantile(brands$c_brand_2017.RData$avg_brand, .75)
          p2018 <- quantile(brands$c_brand_2018.RData$avg_brand, .75)
          p75 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          p2006 <- quantile(brands$c_brand_2006.RData$avg_brand, .90)
          p2007 <- quantile(brands$c_brand_2007.RData$avg_brand, .90)
          p2008 <- quantile(brands$c_brand_2008.RData$avg_brand, .90)
          p2009 <- quantile(brands$c_brand_2009.RData$avg_brand, .90)
          p2010 <- quantile(brands$c_brand_2010.RData$avg_brand, .90)
          p2011 <- quantile(brands$c_brand_2011.RData$avg_brand, .90)
          p2012 <- quantile(brands$c_brand_2012.RData$avg_brand, .90)
          p2013 <- quantile(brands$c_brand_2013.RData$avg_brand, .90)
          p2014 <- quantile(brands$c_brand_2014.RData$avg_brand, .90)
          p2015 <- quantile(brands$c_brand_2015.RData$avg_brand, .90)
          p2016 <- quantile(brands$c_brand_2016.RData$avg_brand, .90)
          p2017 <- quantile(brands$c_brand_2017.RData$avg_brand, .90)
          p2018 <- quantile(brands$c_brand_2018.RData$avg_brand, .90)
          p90 <- c(p2006, p2007, p2008, p2009, p2010, p2011, p2012, p2013,
                   p2014, p2015, p2016, p2017, p2018)
          
          df <- data.frame(years, p10, p25, p50, p75, p90)
          
          ggplot(df, aes(x=years)) + 
            geom_line(aes(y = p10, color = "p10", group = 1L)) +
            geom_line(aes(y = p25, color = "p25", group = 1L)) +
            geom_line(aes(y = p50, color = "p50", group = 1L)) +
            geom_line(aes(y = p75, color = "p75", group = 1L)) +
            geom_line(aes(y = p90, color = "p90", group = 1L)) +
            aes(color = 1L) +
            ggtitle("Time Trends in Unique Brands Purchased") +
            ylab(" Number of Brands Purchased")
          
        })
        
        
    })






