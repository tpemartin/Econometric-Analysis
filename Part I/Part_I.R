## ------------------------------------------------------------------------
rm(list=ls())

## ------------------------------------------------------------------------
library(readr)
airlines <- read_csv("https://raw.githubusercontent.com/tpemartin/Econometric-Analysis/master/Part%20I/airlines.csv")

## ------------------------------------------------------------------------
model<-log(C)~log(Q)+I(log(Q)^2)+log(PF)+LF

## ------------------------------------------------------------------------
out1<-lm(model,data=airlines)
summary(out1)

## ------------------------------------------------------------------------
library(sandwich) # For vcovHC function
library(lmtest) # For coeftest and bptest

## ------------------------------------------------------------------------
coeftest(out1,vcov=vcovHC(out1,type='HC0'))

## ------------------------------------------------------------------------
library(nlme) # For gls

## ------------------------------------------------------------------------
out2<-gls(model,data=airlines,weights=varExp(form=~LF)) 
summary(out2)

## ------------------------------------------------------------------------
airlines$BigQ<-(airlines$Q>0.2)

## ------------------------------------------------------------------------
out3<-gls(model,data=airlines,weights=varExp(form=~ LF | BigQ)) 
summary(out3)

## ------------------------------------------------------------------------
out5<-gls(model,data=airlines,weights=varIdent(form=~ 1 | BigQ)) 
summary(out5)

## ------------------------------------------------------------------------
bptest(model,data=airlines)

## ------------------------------------------------------------------------
bptest(model,varformula=~LF,data=airlines)

