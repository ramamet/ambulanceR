#+++++++++++++++++++++++++++++
# supporting library
library(readxl)
library(dplyr)
#+++++++++++++++++++++++++++++++
#default values
ambul.hist <- list() 

for (sheet.numb in 3:13){
#load.file <- function(sheet.numb= 8 ){
#+++ sheet names
file <- 'ambulance-borough-monthly.xlsx'
sheets <- excel_sheets(file)
#++++++++++++++++++++++++++++++++++++++++

# load ambulance data
#amb <- read_excel("ambulance-borough-monthly.xlsx", sheet=sheet.numb)
amb <- read_excel(file, sheet=sheet.numb)
#amb1 <- select(amb,Borough,`Jul 2009`,`Aug 2009`, `Sep 2009`)
amb1 <- amb
amb2 <- data.frame(amb1)
#nr <- nrow(amb2)
#nr <- 34
amb2 <- amb2[1:33,]
colnames(amb2)[2] = "Area"

#geo codes
geo <- read.csv("averagehousepricesborough_longlat.csv")
geo1 <- select(geo,Area,Longitude,Latitude) 

dff <- merge(x = amb2, y = geo1, by = "Area", all.x = TRUE)
ambul.hist[[sheet.numb]] <- merge(x = amb2, y = geo1, by = "Area", all.x = TRUE)
# cp=sheets[sheet.numb]
# cpp=gsub(" ",".",cp)
}

save(ambul.hist, file="data/ambul.hist.rda")

ambul.type = data.frame(sheets)
save(ambul.type, file="data/ambul.type.rda")