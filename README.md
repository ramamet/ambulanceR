map.ambul - Ambulance location and relocation problems
===========================================================================

> *Copyright 2017 [Ramanathan Perumal](http://github.com/ramamet). Licensed under
> the MIT license.*
:snowflake::snowman:

Background:
------------
`London boroughs` are 32 of the 33 local authority districts of the Greater London administrative area (the 33rd is the City of London) and are each governed by a London borough council. `Emergency Medical Services (EMS)`, generally known as ambulance services, provide medical transport and/or out-of-hospital medical care to patients at scenes of incidents
or to people who are in need. The static ambulance location problem searches for station locations and an allocation
of a fixed number of ambulances to the stations for a planning horizon. The analytics are applied to a real instance in London city. Various causes of service levels are reflected to investigate how the number of
incidents and the time evalution at each level affect the quality of EMS service.

Installation :computer::inbox_tray::books:
------------
`ambulanceR` is available through GitHub.

To install the latest version from GitHub:

    install.packages("devtools")
    library(devtools)
    devtools::install_github("ramamet/ambulanceR")
    

Usage :office::wrench::card_index:
-----

We'll first load the package, and then see how all the
functions work.
   
    > library("ambulanceR")
   
Collect the name of columns in the dataset,

    > ambul.type
                              sheets
    1                       Metadata
    2                 London Summary
    3         All Ambulance Attended
    4          Binge Drinking Report
    5           All Assaults Borough
    6             Gun Injury Borough
    7           Knife Injury Borough
    8            All Weapons Borough
    9      Injured by Animal Borough
    10 Assault Against Women Borough
    11         Assault Against Teens
    12       Cocaine Overdose Report
    13        Heroin Overdose Report

Available months in the main dataset,

    > names()
     [1] "Area"      "Code"      "Jul.2009"  "Aug.2009"  "Sep.2009"  "Oct.2009" 
     [7] "Nov.2009"  "Dec.2009"  "Jan.2010"  "Feb.2010"  "Mar.2010"  "Apr.2010" 
    [13] "May.2010"  "Jun.2010"  "Jul.2010"  "Aug.2010"  "Sep.2010"  "Oct.2010" 
    [19] "Nov.2010"  "Dec.2010"  "Jan.2011"  "Feb.2011"  "Mar.2011"  "Apr.2011" 
    [25] "May.2011"  "Jun.2011"  "Jul.2011"  "Aug.2011"  "Sep.2011"  "Oct.2011" 
    [31] "Nov.2011"  "Dec.2011"  "Jan.2012"  "Feb.2012"  "Mar.2012"  "Apr.2012" 
    [37] "May.2012"  "Jun.2012"  "Jul.2012"  "Aug.2012"  "Sep.2012"  "Oct.2012" 
    [43] "Nov.2012"  "Dec.2012"  "Jan.2013"  "Feb.2013"  "Mar.2013"  "Apr.2013" 
    [49] "May.2013"  "Jun.2013"  "Jul.2013"  "Aug.2013"  "Sep.2013"  "Oct.2013" 
    [55] "Nov.2013"  "Dec.2013"  "Jan.2014"  "Feb.2014"  "Mar.2014"  "Apr.2014" 
    [61] "May.2014"  "Jun.2014"  "Jul.2014"  "Aug.2014"  "Sep.2014"  "Oct.2014" 
    [67] "Nov.2014"  "Dec.2014"  "Jan.2015"  "Feb.2015"  "Mar.2015"  "Apr.2015" 
    [73] "May.2015"  "Jun.2015"  "Jul.2015"  "Aug.2015"  "Sep.2015"  "Oct.2015" 
    [79] "Nov.2015"  "Dec.2015"  "Jan.2016"  "Feb.2016"  "Mar.2016"  "Apr.2016" 
    [85] "May2014"   "Jun.2016"  "Jul.2016"  "Longitude" "Latitude" 

Default plot,
For example, you can select sheet.numb= N, where N can be taken from ambul.type (incidents) dataset and sel= "Month" where Month can be chosen from the collected series, 
    
    > map.ambul(sheet.numb=3,sel="Jul.2016")
    
![ambul](https://cloud.githubusercontent.com/assets/16385390/25645184/02ee11a2-2fac-11e7-9f8a-0f61d7ebffec.png)    

Here you can notice that maximum incident is indicated with blue heartbeat circle and minimum incident is marked with green heartbeat circle for better visualization.    

rawData :hospital::ledger::clipboard:
-----
https://www.london.gov.uk/

contact :mailbox::package:
-----
If you like to contribute further on this package or bugs, please respond me by `ramamet4@gmail.com`.    
