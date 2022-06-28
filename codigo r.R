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

dataoutcome<- select(rctdataclean,ab.effect,ab.pvalue,an.outcome,me.outcomes,me.out.mensur,re.part.analise,re.effectsizes,re.adverse.events)


###Critical appraisal###

datacriticalappraisal<- select(rctdataclean,in.hypothesis,me.stat.desc,di.bias,di.spin)


###Analise descritiva###
####Frequencia absoluta####

library(dplyr)

library(psych)

glimpse(datatransparency)
glimpse(rctdataclean)

###transparency###
table(datatransparency$regist)
table(datatransparency$protocol)
table(datatransparency$data.statem)

###Completeness###

View(datacompleteness)
table(datacompleteness$title.ident)
table(datacompleteness$me.tid2)
table(datacompleteness$me.design)
table(datacompleteness$me.tid1)
table(datacompleteness$re.date.recrut)
table(datacompleteness$fund.statem)
table(datacompleteness$coi.statem)

###participants###
table(dataparticipants$me.eleg.crit)
table(dataparticipants$me.tid5)
table(dataparticipants$re.part.flow)

###Intervention###

table(dataintervention$ab.interv)
table(dataintervention$me.tid3)
table(dataintervention$me.tid4)
table(dataintervention$me.tid6)
table(dataintervention$me.tid7)
table(dataintervention$me.tid8)
table(dataintervention$me.tid9)
table(dataintervention$me.tid11)

###Methodological rigor###

table(datamethodologicalrigor$me.random)
table(datamethodologicalrigor$me.allocation)
table(datamethodologicalrigor$me.blinding)
table(datamethodologicalrigor$me.ssize)


###Outcome###
table(dataoutcome$an.outcome)
table(dataoutcome$ab.effect)
table(dataoutcome$me.outcomes)
table(dataoutcome$re.table.base)
table(dataoutcome$re.part.analise)
table(dataoutcome$re.effectsizes)

###Critical appraisal###
table(datacriticalappraisal$in.hypothesis)
table(datacriticalappraisal$me.stat.desc)
table(datacriticalappraisal$di.bias)
table(datacriticalappraisal$di.spin)

###Frequencia relativa###

###Transparence###
prop.table(table(datatransparency$regist))
prop.table(table(datatransparency$protocol))
prop.table(table(datatransparency$data.statem))

###Completeness###

prop.table(table(datacompleteness$title.ident))
prop.table(table(datacompleteness$me.tid2))
prop.table(table(datacompleteness$me.design))
prop.table(table(datacompleteness$me.tid1))
prop.table(table(datacompleteness$re.date.recrut))
prop.table(table(datacompleteness$fund.statem))
prop.table(table(datacompleteness$coi.statem))

###Participants###
prop.table(table(dataparticipants$me.eleg.crit))
prop.table(table(dataparticipants$me.tid5))
prop.table(table(dataparticipants$re.part.flow))

###Intervention###

prop.table(table(dataintervention$ab.interv))
prop.table(table(dataintervention$me.tid3))
prop.table(table(dataintervention$me.tid4))
prop.table(table(dataintervention$me.tid6))
prop.table(table(dataintervention$me.tid7))
prop.table(table(dataintervention$me.tid8))
prop.table(table(dataintervention$me.tid9))
prop.table(table(dataintervention$me.tid11))

###Methodological rigor###

prop.table(table(datamethodologicalrigor$me.random))
prop.table(table(datamethodologicalrigor$me.allocation))
prop.table(table(datamethodologicalrigor$me.blinding))
prop.table(table(datamethodologicalrigor$me.ssize))


###Outcome###
prop.table(table(dataoutcome$an.outcome))
prop.table(table(dataoutcome$ab.effect))
prop.table(table(dataoutcome$me.outcomes))
prop.table(table(dataoutcome$re.table.base))
prop.table(table(dataoutcome$re.part.analise))
prop.table(table(dataoutcome$re.effectsizes))

###Critical appraisal###
prop.table(table(datacriticalappraisal$in.hypothesis))
prop.table(table(datacriticalappraisal$me.stat.desc))
prop.table(table(datacriticalappraisal$di.bias))
prop.table(table(datacriticalappraisal$di.spin))


###Descritiva journals###
table(rctdataclean$journal)

