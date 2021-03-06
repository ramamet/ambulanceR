#' map.ambul function
#'
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' contains the Year and the subsequent columns are the sample identifiers.
#' yrMin and yrMax can be used as time duration for the plot.
#'
#' @param Take hmd_pop as input
#' @return ggplot2 graph
#' @export map.ambul
#' @keywords loc , yrMin, yrMax
#' @examples
#' #Example.1; base graph with default values 
#' map.ambul()

#load("ambul.hist.rda")
#load("ambul.type.rda")

map.ambul <- function(sheet.numb= 3, sel="Nov.2015"){
# 
# #+++ sheet names
# file <- 'data/ambulance-borough-monthly.xlsx'
# sheets <- readxl::excel_sheets(file)
# #++++++++++++++++++++++++++++++++++++++++
# 
# # load ambulance data
# #amb <- read_excel("ambulance-borough-monthly.xlsx", sheet=sheet.numb)
# amb <- readxl::read_excel(file, sheet=sheet.numb)
# #amb1 <- select(amb,Borough,`Jul 2009`,`Aug 2009`, `Sep 2009`)
# amb1 <- amb
amb1 <- ambul.hist[[sheet.numb]]
amb2 <- data.frame(amb1)
#nr <- nrow(amb2)
#nr <- 34
amb2 <- amb2[1:33,]
#colnames(amb2)[2] = "Area"

#geo codes
#geo <- read.csv("data/averagehousepricesborough_longlat.csv")
#geo <- ambul.type
#geo1 <- dplyr::select(geo,Area,Longitude,Latitude) 

#dff <- merge(x = amb2, y = geo1, by = "Area", all.x = TRUE)

dff <- amb2

#++++++++++++

selColNum <- grep(sel,names(dff))
pp1 <- dff[,selColNum]
pp2 <- data.frame(pp1)
colnames(pp2)[1]= sel

pp3 <- dplyr::select(dff,Area, Longitude, Latitude)
pp4 <- cbind(pp3,pp2)
                     
pp5 <- dplyr::mutate(pp4,id=paste(Area," [ ",pp4[,4]," ]",sep=""))    

Avg <- mean(pp4[,4])
Max <- max(pp4[,4])
Min <- min(pp4[,4])

ss1 <- pp4[which.max(pp4[,4]),]
ss1$labl <- "Max.Risk"

ss2 <- pp4[which.min(pp4[,4]),]
ss2$labl <- "Min.Risk"

ss <- rbind(ss1,ss2)

tit= ambul.type
tit$name= as.character(tit$sheets)

sheet.tit <- paste0(tit[sheet.numb,2]," - ",sel,sep="")

icon.pop <- leaflet.extras::pulseIcons(color = ifelse(ss[,4] == Max ,'blue','green'),
                       heartbeat = ifelse(ss[,4] == Max,'0.4','0.7'))
                       
             

leaflet::leaflet(pp4) %>% 
  #addProviderTiles(providers$CartoDB.DarkMatter) %>%
  # addProviderTiles(providers$Thunderforest.TransportDark)%>%
  leaflet::addProviderTiles(leaflet::providers$CartoDB.Positron) %>%
  #addProviderTiles(providers$OpenStreetMap.Mapnik) %>%
  #setView( 178, -20, 5 ) %>%
  leaflet.extras::addHeatmap(lng = ~Longitude, lat = ~Latitude, intensity =~pp4[,4], 
             blur = 40, max = Max, radius = 50) %>%   
  leaflet.extras::addPulseMarkers(
    lng= ss$Longitude, lat= ss$Latitude,
    label=ss$labl,
    labelOptions = rep( leaflet::labelOptions(noHide = F)),
    icon = icon.pop) %>%
    leaflet::addCircleMarkers(
    lng= (ss1$Longitude), lat= (ss1$Latitude)+0.1,
    label=sheet.tit,
     radius=600 , 
      color=~ifelse(ss1[,4]<0 , "orange", "grey10"),
      stroke = TRUE, 
      fillOpacity = 0.01,
    labelOptions =  leaflet::labelOptions(noHide = T, direction = 'right')
    )   %>%
    leaflet::addCircleMarkers(lng = pp5$Longitude, lat = pp5$Latitude , 
    popup = pp5$id, 
    radius= 10,
    color=~ifelse(pp4[,4]<=0 , "black", "yellow"),
    fillOpacity = 0.01)    
 
    
 }   



