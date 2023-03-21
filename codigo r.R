https://github.com/andresaignacio/SeesRcts
rctdata <- gapminder

# Rename columns/variable names to make it simpler variable names

colnames(RCTdata)

library(dplyr)
RCTdata<-rename(RCTdata,journal=5,pubyear=6,pubmonth=7,study.title=8,pmid=9,doi=10,date.submi=13,acceptdate=14,regist=15,regist.number=16,protocol=17,title.ident=18,ab.effect=19,ab.pvalue=20,report.guide=21,cited.guide=22,health.cond=23,age.group=24,sample.size=25,groups=26,data.statem=27,fund.statem=28,funders=29,coi.statem=30,ab.interv=37,an.outcome=38,me.tid2=39,in.hypothesis=40,in.object=41,me.design=42,me.eleg.crit=43,me.outcomes=44,me.out.mensur=45,me.random=46,me.allocation=47,me.blinding=48,me.ssize=49,me.itt.pps=50,me.tid1=51,me.tid3=52,me.tid4=53,me.tid5=54,me.tid6=55,me.tid7=56,me.tid8=57,me.tid9=58,me.tid11=59,me.tid12=60,me.stat.desc=61,re.part.flow=62,re.date.recrut=63,re.table.base=64,re.part.analise=65,re.effectsizes=66,re.adverse.events=67,re.tid10=68,re.change.protocol=69,di.bias=70,di.spin=71)

View(RCTdata)

# Delete column##

library(dplyr)

rctdataclean<-select(RCTdata,journal,pubyear,pubmonth,study.title,pmid,doi,date.submi,acceptdate,regist,regist.number,protocol,title.ident,ab.effect,ab.pvalue,report.guide,cited.guide,health.cond,age.group,sample.size,groups,data.statem,fund.statem,funders,coi.statem,ab.interv,an.outcome,me.tid2,in.hypothesis,in.object,me.design,me.eleg.crit,me.outcomes,me.out.mensur,me.random,me.allocation,me.blinding,me.ssize,me.itt.pps,me.tid1,me.tid3,me.tid4,me.tid5,me.tid6,me.tid7,me.tid8,me.tid9,me.tid11,me.tid12,me.stat.desc,re.part.flow,re.date.recrut,re.table.base,re.part.analise,re.effectsizes,re.adverse.events,re.tid10,re.change.protocol,di.bias,di.spin)

#DATA EXPORT.csv
write.csv(rctdataclean,"rctdataclean.csv")


#### componentlabels ###

library(dplyr)

###transparency###


datatransparency <-select(rctdataclean,regist,protocol,data.statem,re.tid10,re.change.protocol)


###Completeness###

datacompleteness <-select(rctdataclean,in.object,me.design,me.tid1,me.tid12,re.date.recrut)


###Participants###

dataparticipants <-select(rctdataclean,me.eleg.crit,me.tid5,re.part.flow)


###Intervention###

dataintervention <-select(rctdataclean,ab.interv,me.tid3,me.tid4,me.tid6,me.tid7,me.tid8,me.tid9,me.tid11)


###Methodological rigor###

datamethodologicalrigor <-select(rctdataclean,me.random,me.allocation,me.blinding,me.ssize,me.itt.pps)


###Outcome###

dataoutcome<- select(rctdataclean,ab.effect,ab.pvalue,an.outcome,me.outcomes,me.out.mensur,re.part.analise,re.effectsizes,re.adverse.events,re.table.base)


###Critical appraisal###

datacriticalappraisal<- select(rctdataclean,in.hypothesis,me.stat.desc,di.bias,di.spin)


###Analise descritiva###
####Frequencia absoluta####

###Descriptive analysis###

library(DescTools)
Desc(datatransparency,plotit = F)
Desc(datacompleteness,plotit = F)
Desc(datacriticalappraisal,plotit = F)
Desc(dataintervention,plotit = F)
Desc(datamethodologicalrigor,plotit = F)
Desc(dataoutcome,plotit = F)
Desc(dataparticipants,plotit = F)




###Descritiva journals###
table(rctdataclean$journal)

#### FALTA COLOCAR SELEÇÃO DO BANCO DE ANALISE####

library(DescTools)

geral = transform(geral, contagem = rowSums(geral== c("1")))

with(geral,Desc(contagem))

journal=subset(geral,select = c("journal","contagem"))

#Frequencia geral por dominio###

library(tidyverse)

Completeness=transform(completness,sim=in.object+
                      me.design+
                      me.tid1+
                      me.tid12+
                      re.date.recrut)
with(completeness,Desc(sim))

esc(Participants, plotit = F)

Participants=transform(Participants, sim=me.eleg.crit+
                       re.part.flow)

with(Participants,Desc(sim))

intervention=transform(intervention,sim=ab.interv+
                       me.tid3+
                       me.tid4+
                       me.tid5+
                       me.tid6+
                       me.tid7+
                       me.tid8+
                       me.tid9+
                       me.tid11)

with(intervention, Desc(sim))

methodologicalrigor=transform(methodologicalrigor,sim=me.random+
                              me.allocation+
                              me.blinding+
                              me.ssize+
                              me.itt.pps)

with(methodologicalrigor,Desc(sim))

outcome=transform(outcome, sim=ab.effect+
                  ab.pvalue+
                  an.outcome+
                  me.outcomes+
                  me.out.mensur+
                  re.part.analise+
                  re.effectsizes+
                  re.adverse.events)

with(outcome,Desc(sim))

criticalappraisal=transform(criticalappraisal, sim=in.hypothesis+
                            me.stat.desc+
                            di.bias+
                            di.spin)

with(criticalappraisal,Desc(sim))


#ANÁLISE DE ESTUDOS COM E SEM REGISTRO#

library(readxl)
geral <- read_excel("geral 2020.xlsx")
View(geral)

library(tidyverse)
geral<-geral%>%
  mutate(
  transparencia=regist+
  protocol+
  data.statem+
  re.tid10+
  re.change.protocol
  )

table(geral$transparencia,geral$regist)

prop.table(table(geral$transparencia,geral$regist),margin = 1)

library(rstatix)

prop_trend_test(table(geral$transparencia,geral$regist))

geral<-geral%>%
  mutate(
    completeness=in.object+
    me.design+
    me.tid1+
    me.tid12+
    re.date.recrut+
    title.ident+
    report.guide+
    fund.statem+
    coi.statem+
    me.tid2
  )

table(geral$completeness,geral$regist)

prop.table(table(geral$completeness,geral$regist),margin = 1)

prop_trend_test(table(geral$completeness,geral$regist))

geral<-geral%>%
  mutate(
    outcome=ab.effect+
    ab.pvalue+
    an.outcome+
    me.outcomes+
    me.out.mensur+
    re.part.analise+
    re.effectsizes+
    re.adverse.events+
    re.table.base
  )

table(geral$outcome,geral$regist)

prop.table(table(geral$outcome,geral$regist),margin = 1)

prop_trend_test(table(geral$outcome,geral$regist))

geral<-geral%>%
  mutate(
    intervention=ab.interv+
    me.tid3+
    me.tid4+
    me.tid5+
    me.tid6+
    me.tid7+
    me.tid8+
    me.tid9+
    me.tid11
  )

table(geral$intervention,geral$regist)

prop.table(table(geral$intervention,geral$regist),margin = 1)

prop_trend_test(table(geral$intervention,geral$regist))

geral<-geral%>%
  mutate(
    participants=me.eleg.crit+
    re.part.flow
  )

table(geral$participants,geral$regist)

prop.table(table(geral$participants,geral$regist),margin = 1)

prop_trend_test(table(geral$participants,geral$regist))

geral<-geral%>%
  mutate(
    critapp=in.hypothesis+
    me.stat.desc+
    di.bias+
    di.spin
  )

table(geral$critapp,geral$regist)

prop.table(table(geral$critapp,geral$regist),margin = 1)

prop_trend_test(table(geral$critapp,geral$regist))

geral<-geral%>%
  mutate(
    rigormeth=me.random+
    me.allocation+
    me.blinding+
    me.ssize+
    me.itt.pps
  )

table(geral$rigormeth,geral$regist)

prop.table(table(geral$rigormeth,geral$regist),margin = 1)

prop_trend_test(table(geral$rigormeth,geral$regist))

###Qui quadrado de independência por itens recomendado###

library(readxl)
dados <- read_excel("SeesRcts/geral 2020.xlsx","geral2")
View(dados)

library(dplyr)
library(rstatix)
library(psych)
library(corrplot)

protocol<-table(dados$regist,dados$protocol)
protocol

x2protocol<- chisq.test(protocol)
x2protocol

title.ident<-table(dados$regist,dados$title.ident)
title.ident

x2title.ident<- chisq.test(title.ident)
x2title.ident

ab.effect<-table(dados$regist,dados$ab.effect)
ab.effect

x2ab.effect<- chisq.test(ab.effect)
x2ab.effect

Ab.pvalue<-table(dados$regist,dados$ab.pvalue)
Ab.pvalue

x2Ab.pvalue<- chisq.test(Ab.pvalue)
x2Ab.pvalue

report.guide<-table(dados$regist,dados$report.guide)
report.guide

x2report.guide<- chisq.test(report.guide)
x2report.guide
