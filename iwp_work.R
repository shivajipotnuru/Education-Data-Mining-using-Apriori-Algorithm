
#Reading Data
#original=read.csv("~/Downloads/studentAssessment.csv")
#print(original)

start=Sys.time()
library(data.table)
#original2=read.csv("~/Downloads/Student_Performance_Data.csv")

#PARALLIZING READING ~ fread

original2=read.csv("~/Downloads/Student_Performance_Data.csv")

print(original2)

#Preprocessing


#data1=as.data.table(original)
data2=as.data.table(original2)

#temp1=data2[,list(Marks),by=c("Student_ID","Semster_Name","Paper_Name")]

data2=data2[,c(1,2,4,5)]
print(data2)

data2=data2[Marks<50]
print(data2)


subjectsfailing = data2[,list(Avg=mean(data2$Marks)),by=c("Semster_Name","Paper_Name")]

#Plotting
library(ggplot2)
#ggplot(data2[,Avg=mean(Marks),by(Student_ID)],aes(Paper_Name,Marks,color=Paper_Name))+geom_line()

#Dependencies 
#install.packages("plyr", dependencies= TRUE)

if(sessionInfo()['basePkgs']=="dplyr" | sessionInfo()['otherPkgs']=="dplyr")
{
  detach(package:dplyr, unload=TRUE)
}

library(plyr)
library(dplyr)
library(foreach)
library(doParallel)
library(parallel)


data2=data2[,Paper:=paste(Semster_Name,Paper_Name)]  
print(data2)

data2<-ddply(data2,c("Student_ID","Semster_Name"),function(data2)paste(data2$Paper,collapse = ","))
data2$Semster_Name<-NULL
data2$Student_ID<-NULL
colnames(data2) <- c("Paper")

print(data2)

#Parallel write.csv
write.csv(data2,"~/Downloads/Data2.csv", quote = FALSE, row.names = TRUE)


#Association rules
#install.packages("arules", dependencies=TRUE)
library(arules)
library(arulesViz)


txn = read.transactions(file="~/Downloads/Data2.0.csv", rm.duplicates= TRUE, format="basket",sep=",",cols=1)
txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels)

library(RColorBrewer)
itemFrequencyPlot(txn,topN=20,type="absolute",col=brewer.pal(8,'Pastel2'), main="Absolute Item Frequency Plot")

basket_rules<- apriori(txn,parameter = list(minlen=6,sup = 0.035, conf = 0.7,target="rules"))
end=Sys.time()
basket_rules<- apriori(txn,parameter = list(minlen=5,sup = 0.07, conf = 0.5,target="rules"))
basket_rules<- apriori(txn,parameter = list(minlen=4,sup = 0.1, conf = 0.7,target="rules"))


inspect(basket_rules)


#Alternative to inspect() is to convert rules to a dataframe and then use View()

df_basket <- as(basket_rules,"data.frame")
View(df_basket)


library(arulesViz)
plot(basket_rules)
plot(basket_rules, method = "grouped", control = list(k = 5))
plot(basket_rules, method="graph", control=list(type="items"))
#plot(basket_rules, method="paracoord",  control=list(alpha=.5, reorder=TRUE))
plot(basket_rules,method="two-key plot")
plot(basket_rules[1:10], method = "graph",  engine = "htmlwidget")
#plot(basket_rules[1:10],measure=c("support","lift"),shading="confidence",interactive=T)


print(end-start)

