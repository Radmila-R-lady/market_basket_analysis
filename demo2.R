
##########################################Uvod u R programiranje##################################
#################################################Share Square#####################################
#############################################Radmila Velièkoviæ###################################
####################################################19.9.2018#####################################



####################DEMO###############################
#R kao kalkulator

2+3
vrednost<-2+3
vrednost^2

#Bulova algebra

2<1  #dva je manje od jedan?
2==2 # dva je jednako dva?
2>1      # dva je veæe od 1?
2!=1     #dva nije jednako jedan
2!=2  #dva nije jednako dva

#Hajde da napravimo objekat x
#u kojem æe se naæi tekst
x<-"Hello World"
#i isti takav objekat koji æe sadržati numerièku vrednost
x<-6 # preimenovali smo sadržaj objekta, objekat više ne sadrži Hello World
print(x)
x 
#Napravimo objekat y i u njega da upišemo više od jednog elementa
#U tom slucaju nam je potrebna concatenate funkcija. 
y<-c(1,2)
y<-(1,2) #nešto nije u redu, R traži ispravku koda, nedostaje nam c()
z<-c(1,2,3,5,5,7,,NA,7,NA,NA) #
class(z)
z<-c(1,2,3,5,5,7,"",NA,7,NA,NA)
z<-c(1,2,3,5,5,7,NA,7,NA,NA)
mean(y)
mean(z,na.rm = T)
sd(z, na.rm = T)  #depracated; f-ja æe biti uklonjena u nekom trenutku
rm(z) #ovaj objekat više ne želimo, uklonimo ga. Primetite da se više ne nalazi u global environment

View(z)

#Traženje pomoæi 
??mean #ako ne znate naziv f-je 
help(sd) #ako znate naziv f-je

#Matrièni svet u R-u

#matrica reda 2x3
A<-matrix(c(1,2,3,2,5,8),
          nrow = 2,
          ncol = 3,
          byrow = T)

#transponujmo matricu
t(A)
#moguæe je proveriti da li je matrica (anti)simetrièna/komutativna/rang/determinantu itd.

###############################Vaši prvi koraci u R-u


######RBase#######


######importovanje datasetova
#Neki datasetovi veæ postoje u R-u
View(iris)
str(iris)
dim(iris)
which(iris$Sepal.Length == 5.1) #gde je sepal.length jednak 5.1; dobiæemo pozicije na kojima se te vrednosti nalaze
which(npk$yield == 62)
#Neki datasetovi su deo paketa koji uèitate

#datasetove možete uèitati iz excela, SPSS-a, txt-a, ili bilo kog drugog formata ili skinuti sa interneta (webscraping)


#Hoæemo da importujemo csv file koji smo saèuvali na Desktopu
#ali gde æe R da traži taj file
getwd() #get working directory; R oèekuje da je file tu
setwd("C:/Users/Rada/Desktop/DeMo") #Kažimo R-u gde da traži naš fajl 

#importovanje podataka iz csv file-a

challenge=read.table("challenge.csv",header=T,sep=",") 
View(challenge)


#prikaži nazive varijabli
names(challenge) 

#importovanje podataka iz SPSS-a
install.packages("foreign")  #dovoljno je jednom instalirati; 
library(foreign) 
sharesquare<-as.data.frame(read.spss("C:/Users/Rada/Desktop/DeMo/sharesquare_1.sav"))
#kako izgleda dataset
View(sharesquare)
#kakva je struktura podataka
str(sharesquare)
attach(sharesquare)
class(sharesquare)
class(alter)
class(h2_4)
levels(h2_4)

Freq = table(h2_4)
Freq

detach(sharesquare)

barplot(sharesquare$h2_4)
sharesquare$h2_4<-as.factor(sharesquare$h2_4)
class(sharesquare$h2_4)
plot(sharesquare$h2_4)
hist(sharesquare$alter)

install.packages("dplyr")  #samo jednom instalirati
library(dplyr)
sharesquareA<-select(sharesquare, uid,alter,h2_4)
View(sharesquareA)
str(sharesquareA)

Older.than.30<-filter(sharesquareA, alter>30)
View(Older.than.30)
hist(Older.than.30$alter)
rm(Older.than.30)
rm(sharesquareA)


# KRAJ --------------------------------------------------------------------



