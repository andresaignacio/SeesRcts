https://github.com/andresaignacio/SeesRcts
rctdata <- gapminder

# Rename columns/variable names to make it simpler variable names

colnames(RCTdata)

library(dplyr)
RCTdata<-rename(RCTdata,journal=5,pubyear=6,pubmonth=7,study.title=8,pmid=9,doi=10,subdate=13,acceptdate=14,regist=15,regist.number=16,protocol=17,title.ident=18,ab.effect=19,ab.pvalue=20,report.guide=21,cited.guide=22,health.cond=23,age.group=24,sample.size=25,groups=26,data.statem=27,fund.statem=28,funders=29,coi.statem=30,ab.interv=37,an.outcome=38,me.tid2=39,in.hypotesis=40,in.objetc=41,me.design=42,me.eleg.crit=43,me.outcomes=44,me.out.mensur=45,me.random=46,me.allocation=47,me.blinding=48,me.ssize=49,me.itt.pps=50,me.tid1=51,me.tid3=52,me.tid4=53,me.tid5=54,me.tid6=55,me.tid7=56,me.tid8=57,me.tid9=58,me.tid11=59,me.tid12=60,me.stat.desc=61,re.part.flow=62,re.date.recrut=63,re.table.base=64,re.part.analise=65,re.precision.meansur=66,re.adverse.events=67,re.tid10=68,re.change.protocol=69,di.bias=70,di.spin=71)
