library(stats)
library(dplyr)
library(readr)

## Load Bike Data

January2024<- read_csv("202401-divvy-tripdata.csv")
February2024<- read_csv("202402-divvy-tripdata.csv")
March2024<-read_csv("202403-divvy-tripdata.csv")
April2024<-read_csv("202404-divvy-tripdata.csv")
May2024<- read_csv("202405-divvy-tripdata.csv")
June2024<- read_csv("202406-divvy-tripdata.csv")
July2024<- read_csv("202407-divvy-tripdata.csv")
August2024<- read_csv("202408-divvy-tripdata.csv")
September2024<- read_csv("202409-divvy-tripdata.csv")
October2024<- read_csv("202410-divvy-tripdata.csv")
November2024<- read_csv("202411-divvy-tripdata.csv")
December2024<- read_csv("202412-divvy-tripdata.csv")

## Create a sample for each month

samp1<- sample_n(January2024, 10000)
samp2<- sample_n(February2024, 10000)
samp3<- sample_n(March2024, 10000)
samp4<- sample_n(April2024, 10000)
samp5<- sample_n(May2024, 10000)
samp6<- sample_n(June2024, 10000)
samp7<- sample_n(July2024, 10000)
samp8<- sample_n(August2024, 10000)
samp9<- sample_n(September2024, 10000)
samp10<- sample_n(October2024, 10000)
samp11<- sample_n(November2024, 10000)
samp12<- sample_n(December2024, 10000)

## Compile Sample into a dataframe for the 2024 year

divvy_bike_trip_2024<- rbind(samp1, samp2, samp3, samp4, samp5, samp6, samp7, samp8, samp9, samp10, samp11, samp12)

## Write out dataframe to a csv to use in excel
## while importing into google sheets was difficult because some files were bigger than others, we can now load all our data in one piece.
## Taking a sample ensures that some times of the year are not more represented in our data than others
## There are a few pitfalls. We have to make inferences about the population from the sample now.

write.csv(divvy_bike_trip_2024, "2024-divvy-tripdata.csv")
