##########################################Uvod u R programiranje##################################
#################################################Share Square#####################################
#############################################Radmila Veličković###################################
####################################################28.10.2018#####################################
##################################################e-mail: radmila.velichkovich@gmail.com###########
##################################################whatsapp/viber: +41787683200###################

######importovanje datasetova
#Neki datasetovi već postoje u R-u
#Npr. iris 
#https://en.wikipedia.org/wiki/Iris_flower_data_set
#kako izgleda dataset
View(iris)
#kakva je struktura podataka
str(iris)
#broj observacija i varijabli
dim(iris)
#airquality set podataka 
#https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/airquality.html
View(airquality)
str(airquality)
dim()
#Neki setovi podataka su deo paketa koji učitate 
#(svaki paket bi trebalo da sadrži primer seta podataka)

#setove podataka možete učitati iz excela, SPSS-a, txt-a, ili bilo kog drugog formata ili pokupiti sa interneta (webscraping)

#Hoćemo da importujemo csv file koji smo sačuvali na Desktopu
#ali gde će R da traži taj file?
getwd() #get working directory; R očekuje da je file tu
setwd("C:/Users/Rada/Desktop/DeMo") #Kažimo R-u gde da traži naš fajl

#importovanje podataka iz csv file-a

#Hoćemo da importujemo csv file koji smo sačuvali na Desktopu
#ali gde će R da traži taj file?


getwd() #get working directory; R očekuje da je file tu
setwd("C:/Users/Rada/Desktop/DeMo") #Kažimo R-u gde da traži naš fajl 

#importovanje podataka iz csv file-a

challenge=read.table("challenge.csv",header=T,sep=",") 
View(challenge)

#prikaži nazive varijabli
names(challenge) 

#importovanje podataka iz SPSS-a
install.packages("foreign")  #dovoljno je jednom instalirati; 
library(foreign) #potrebno je izvršiti komandu svaki put kada iznova učitamo R
sharesquare<-as.data.frame(read.spss("C:/Users/Rada/Desktop/DeMo/sharesquare_1.sav"))

View(sharesquare)
str(sharesquare)
#"zakačimo" dataset za memoriju
attach(sharesquare)

alter

class(sharesquare)
class(alter)
class(h2_4)
levels(h2_4)

Freq = table(h2_4)
Freq
#hajmo da promenimo naziv varijable h2_4
#opšti oblik funkcije i njenih argumenata;
#df je naziv dataframe-a; old.var.name je naziv stare a new.var.name je naziv nove varijable
names(df)[names(df) == 'old.var.name'] <- 'new.var.name'
#
names(sharesquare)[names(sharesquare) == 'h2_4'] <- 'listening_to_music'

names(sharesquare)[names(sharesquare) == "h1_3"] <- "h1_3"     #nije se ništa promenilo
#odlepimo dataset sa memorije 
detach(sharesquare)
#kog je tipa objekat sharequare?
class(sharesquare)
#kog je tipa objekat listening_to_music?
class(sharesquare$listening_to_music)
#napravimo barchart
plot(sharesquare$listening_to_music)
#kog je tipa objekat alter?
class(sharesquare$alter)
#alter je numeric, da nije bio numeric pretvorili bismo ga u numeric na sl.način:
sharesquare$alter<-as.numeric(sharesquare$alter)
hist(sharesquare$alter)


# MANIPULACIJA PODACIMA ---------------------------------------------------
#sharesquare set podataka

install.packages("dplyr")  #samo jednom instalirati
library(dplyr)
sharesquareA<-select(sharesquare, uid,alter,listening_to_music)
View(sharesquareA)
str(sharesquareA)
class(sharesquareA$uid)

#samo stariji od 30
Older.than.30<-filter(sharesquareA, alter>30)
class(Older.than.30)
View(Older.than.30)
hist(Older.than.30$alter)
rm(Older.than.30)
rm(sharesquareA)

#set podataka flight
install.packages("nycflights13")
library(nycflights13)
dim(flights)
flights
View(flights)
names(flights)
#filtrirati redove na osnovu nekog kriterijuma
filter(flights, month == 1, day == 1) 
#to izabrati kolone na osnovu nekog kriterijuma
select(flights, year, month, day)
#ili
select(flights, year:day)
#izabrati sve varijable osim:
select(flights, -(year:day))

View(flights)

mutate(flights,
       gain = arr_delay - dep_delay,
       gain_per_hour = gain / (air_time / 60)
)

new.data<-transmute(flights,
          gain = arr_delay - dep_delay,
          gain_per_hour = gain / (air_time / 60)
)

mean(new.data$gain, na.rm=T)

names(flights)
View(flights)
dim(flights)
names(flights) 


# STATISTIČKA OBRADA PODATAKA ---------------------------------------------

#frekvencija
Freq = table(airquality$Ozone) #frekvencija
CumFreq=cumsum(Freq) #kumulativna frekvencija 
Pct=prop.table(Freq) #procentualni udeo
CumPct=cumsum(Pct)   #kumulativni procentualni udeo
cbind(Freq ,CumFreq, Pct , CumPct) #zajedno prikazati

# srednja vrednost i medijana (sa NAs)
mean(airquality$Ozone) 
mean(airquality$Ozone,trim=0.05)
median(airquality$Ozone)

#srednja vrednost i medijana (bez NAs)
mean(airquality$Ozone, na.rm=T) 
mean(airquality$Ozone,trim=0.05, na.rm=T)
median(airquality$Ozone, na.rm=T)
hist(airquality$Ozone)

#interval varijacije (min i max vrednost)
range(airquality$Ozone, na.rm=T) 
var(airquality$Ozone, na.rm=T)
sd(airquality$Ozone, na.rm=T)

summary(airquality$Ozone)
#sve variable
library(psych)
describe(airquality)
