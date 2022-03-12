library(here)
library(readr)
library(janitor)
library(tidyverse)
library(Hmisc)
library(summarytools)
library(table1)

##Objective: Test for knowledge retained before and after an educational intervention

prepostAssess <- read_csv(here ("data", "prepostAssessment.csv"))

#Clean variable names
prepostAssess<-clean_names(prepostAssess)

#Shorten answers for easier analysis
prepostAssess[,8:12] <- lapply(prepostAssess[,8:12],
                               function(x) substr(x,1,1))
prepostAssess[,18:22] <- lapply(prepostAssess[,18:22],
                               function(x) substr(x,1,1))
#Code either correct or incorrect
prepostAssess<-mutate(prepostAssess, preq1_1 = ifelse(pre_q1 == "b", 1, 0))
freq(prepostAssess$pre_q1)
freq(prepostAssess$preq1_1)

prepostAssess<-mutate(prepostAssess, preq2_1 = ifelse(pre_q2 == "c", 1, 0))
prepostAssess<-mutate(prepostAssess, preq3_1 = ifelse(pre_q3 == "d", 1, 0))
prepostAssess<-mutate(prepostAssess, preq4_1 = ifelse(pre_q4 == "c", 1, 0))
prepostAssess<-mutate(prepostAssess, preq5_1 = ifelse(pre_q5 == "b", 1, 0))

prepostAssess<-mutate(prepostAssess, postq1_1 = ifelse(post_q1 == "b", 1, 0))
freq(prepostAssess$post_q1)
freq(prepostAssess$postq1_1)

prepostAssess<-mutate(prepostAssess, postq2_1 = ifelse(post_q2 == "c", 1, 0))
prepostAssess<-mutate(prepostAssess, postq3_1 = ifelse(post_q3 == "d", 1, 0))
prepostAssess<-mutate(prepostAssess, postq4_1 = ifelse(post_q4 == "c", 1, 0))
prepostAssess<-mutate(prepostAssess, postq5_1 = ifelse(post_q5 == "b", 1, 0))

#Calculate total score of correct answers
prepostAssess<-prepostAssess %>% mutate(preSum = rowSums(.[23:27]))
prepostAssess<-prepostAssess %>% mutate(postSum = rowSums(.[28:32]))
prepostAssess<-prepostAssess %>% mutate(Diff = postSum-preSum)

#Identify the individuals who had answered both the pre and post survey
abx_prepostComplete <- prepostAssess[ which(prepostAssess$both_complete == 1), ]

#Compare the pre-test score to post-test score
mean(abx_prepostComplete$preSum)
mean(abx_prepostComplete$postSum)
mean(abx_prepostComplete$Diff)

median(abx_prepostComplete$preSum)
median(abx_prepostComplete$postSum)

#Statistical test for difference between pre-score and post-score
t.test(abx_prepostComplete$postSum, abx_prepostComplete$preSum, paired = TRUE, alternative = "two.sided")

#Table1
freq(prepostAssess$subspecialty)
freq(prepostAssess$year)
table1(~ subspecialty + year + preSum + postSum, data=prepostAssess, overall="Total")

freq(abx_prepostComplete$subspecialty)
freq(abx_prepostComplete$year)
freq(abx_prepostComplete$post_please_select_your_gender)
table1(~ subspecialty + year + post_please_select_your_gender+ preSum + postSum, data=abx_prepostComplete, overall="Total")

#Table2
lapply(prepostAssess[,23:27],
       function(x) freq(x))
mean(prepostAssess$preSum)

lapply(abx_prepostComplete[,23:27],
       function(x) freq(x))

lapply(abx_prepostComplete[,28:32],
       function(x) freq(x))

table1(~ factor(preq1_1) + factor(preq2_1) + factor(preq3_1) + factor(preq4_1) + factor(preq5_1) + factor(postq1_1) + factor(postq2_1) + factor(postq3_1) + factor(postq4_1) + factor(postq5_1), data=abx_prepostComplete, overall="Total")

mean(prepostAssess$preSum)
mean(abx_prepostComplete$preSum)
mean(abx_prepostComplete$postSum)

##paired Samples Test: Is there a difference in the pre-test score vs. the post-test score
test <- mcnemar.test(table(abx_prepostComplete$preq1_1, abx_prepostComplete$postq1_1))
test

test <- mcnemar.test(table(abx_prepostComplete$preq2_1, abx_prepostComplete$postq2_1))
test

test <- mcnemar.test(table(abx_prepostComplete$preq3_1, abx_prepostComplete$postq3_1))
test

test <- mcnemar.test(table(abx_prepostComplete$preq4_1, abx_prepostComplete$postq4_1))
test

test <- mcnemar.test(table(abx_prepostComplete$preq5_1, abx_prepostComplete$postq5_1))
test

