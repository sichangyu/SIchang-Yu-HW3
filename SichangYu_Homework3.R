install.packages("coronavirus")
library('coronavirus')
corona = head(coronavirus,100)
# date province coutry Covid taken place latitue:the angular distance of a place north or south of the earth's equator,
# or of the equator of a celestial object, usually expressed in degrees and minutes
# longitude: distance measured in degrees east or west from an imaginary line (called the prime meridian)  that goes from the North Pole
# to the South Pole and that passes through Greenwich, England.that goes from the North Pole to the South Pole and that passes through Greenwich, England.
# type:confirmed or not 
# case: number of people infected
install.packages("dplyr")
library(dplyr)

summary_df <- coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

summary_df %>% head(20) 




# Load ggplot2
install.packages("ggplot2")
library(ggplot2)
# Create data
data <- data.frame(
  name=c("US","Brazil","India","Russia","South Africa") ,  
  value=c(4562038,2662485,1695988,838461,493183)
)
# Barplot
ggplot(data, aes(x=name, y=value)) + 
  geom_bar(stat = "identity")+
coord_flip()+
  labs(title = "Top 5 countries by total cases")


recent_cases = coronavirus %>% 
  filter(type == "confirmed") %>%
  group_by(country,date) %>%
  summarise(total_cases = sum(cases)) %>%
  arrange(-total_cases)

recent_case = as.data.frame(recent_cases)
recent_cases$confirmed_cases = recent_case[,3]


recent_cases_line = ggplot(data = recent_cases,aes(x=date, y=confirmed_cases))+
  geom_line(stat = "identity")
  







