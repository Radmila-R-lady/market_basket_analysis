
##########################################Uvod u R programiranje##################################
#################################################Share Square#####################################
#############################################Radmila Veli�kovi�###################################
####################################################19.9.2018#####################################



####################DEMO###############################
#R kao kalkulator

2+3
vrednost<-2+3
vrednost^2

#Bulova algebra

2<1  #dva je manje od jedan?
2==2 # dva je jednako dva?
2>1      # dva je ve�e od 1?
2!=1     #dva nije jednako jedan
2!=2  #dva nije jednako dva

#Hajde da napravimo objekat x
#u kojem �e se na�i tekst
x<-"Hello World"
#i isti takav objekat koji �e sadr�ati numeri�ku vrednost
x<-6 # preimenovali smo sadr�aj objekta, objekat vi�e ne sadr�i Hello World
print(x)
x 
#Napravimo objekat y i u njega da upi�emo vi�e od jednog elementa
#U tom slucaju nam je potrebna concatenate funkcija. 
y<-c(1,2)
y<-(1,2) #ne�to nije u redu, R tra�i ispravku koda, nedostaje nam c()
z<-c(1,2,3,5,5,7,,NA,7,NA,NA) #
class(z)
z<-c(1,2,3,5,5,7,"",NA,7,NA,NA)
z<-c(1,2,3,5,5,7,NA,7,NA,NA)
mean(y)
mean(z,na.rm = T)
sd(z, na.rm = T)  #depracated; f-ja �e biti uklonjena u nekom trenutku
rm(z) #ovaj objekat vi�e ne �elimo, uklonimo ga. Primetite da se vi�e ne nalazi u global environment

View(z)

#Tra�enje pomo�i 
??mean #ako ne znate naziv f-je 
help(sd) #ako znate naziv f-je

#Matri�ni svet u R-u

#matrica reda 2x3
A<-matrix(c(1,2,3,2,5,8),
          nrow = 2,
          ncol = 3,
          byrow = T)

#transponujmo matricu
t(A)
#mogu�e je proveriti da li je matrica (anti)simetri�na/komutativna/rang/determinantu itd.

###############################Va�i prvi koraci u R-u


######RBase#######


######importovanje datasetova
#Neki datasetovi ve� postoje u R-u
View(iris)
str(iris)
dim(iris)
which(iris$Sepal.Length == 5.1) #gde je sepal.length jednak 5.1; dobi�emo pozicije na kojima se te vrednosti nalaze
which(npk$yield == 62)
#Neki datasetovi su deo paketa koji u�itate

#datasetove mo�ete u�itati iz excela, SPSS-a, txt-a, ili bilo kog drugog formata ili skinuti sa interneta (webscraping)


#Ho�emo da importujemo csv file koji smo sa�uvali na Desktopu
#ali gde �e R da tra�i taj file
getwd() #get working directory; R o�ekuje da je file tu
setwd("C:/Users/Rada/Desktop/DeMo") #Ka�imo R-u gde da tra�i na� fajl 

#importovanje podataka iz csv file-a

challenge=read.table("challenge.csv",header=T,sep=",") 
View(challenge)


#prika�i nazive varijabli
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



