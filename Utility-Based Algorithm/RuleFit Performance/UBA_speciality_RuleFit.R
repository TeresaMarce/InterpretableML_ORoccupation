setwd("~/Desktop/Tese/R Tese/R program/Speciality/RuleFit")

install.packages("data.table")
library(data.table)

install.packages('abind')
install.packages('zoo')
install.packages('xts')
install.packages('quantmod')
install.packages('ROCR')

install.packages("DMwR_0.4.1.tar.gz",repos=NULL,dependencies=T)

install.packages("uba_0.7.7.tar.gz",repos=NULL,dependencies=T)


library(uba)
library(rpart)
library(ROCR)


Data_Train_speciality <- fread("Data_withsyntheticdata_speciality")
Labels_RuleFit_speciality_imbalanced <- fread("Labels_RuleFit_speciality_imbalance")
Labels_RuleFit_speciality <- fread("Labels_RuleFit_speciality_notimbalance")
Data_Test_speciality <- fread("Data_test_speciality")

ypred_imbalanced<- Labels_RuleFit_speciality_imbalanced$"Labels from RuleFit"
ypred_not_imbalanced<- Labels_RuleFit_speciality$"Labels from RuleFit"
y <- Data_Test_speciality$"Real Room Duration"

pP <- phi.control(y,method="extremes",extr.type="high")
lP <- loss.control(y)
#plot(y_true, y.phi, type="l",ylab = expression(phi(y)), xlab = expression(y))

yphi <- phi(y,phi.parms=pP)
plot(y, yphi)

uP <- util.control(p=0.90)

u_imbalanced <- util(ypred_imbalanced,y,phi.parms=pP,loss.parms=lP,util.parms = uP,return.uv=TRUE)
u_not_imbalanced <- util(ypred_not_imbalanced,y,phi.parms=pP,loss.parms=lP,util.parms = uP,return.uv=TRUE)

## plot utility surface
util.surface(y,phi.parms=pP,loss.parms=lP,util.parms = uP)
util.isometrics(y,phi.parms=pP,loss.parms=lP,util.parms = uP)
points(ypred_imbalanced,y )
points(ypred_not_imbalanced,y,col="blue" )

## precision
precision_param <- util.control(umetric="P",event.thr=1,p=0.90)
prec_imbalanced <- util(ypred_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = precision_param)
prec_not_imbalanced <- util(ypred_not_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = precision_param)


## recall
recall_param <- util.control(umetric="R",event.thr=1,p=0.90)
rec_imbalanced <- util(ypred_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = recall_param)
rec_not_imbalanced  <- util(ypred_not_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = recall_param)

## mu
uP <- util.control(umetric="MU",p=0.9) ## default
mu_imbalanced <- util(ypred_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = uP)
mu_not_imbalanced <- util(ypred_not_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = uP)

## F-measure
Fm <- util.control(umetric="Fm",event.thr=1,beta=1)

fm_imbalanced <- util(ypred_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = Fm)
fm_not_imbalanced <- util(ypred_not_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = Fm)

## AUCROC-U
uP <- util.control(umetric="AUCROC",event.thr=1)
aucroc_imbalanced  <- util(ypred_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = uP)
aucroc_not_imbalanced  <- util(ypred_not_imbalanced, y, phi.parms=pP, loss.parms=lP, util.parms = uP)


