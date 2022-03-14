#power analysis
library(pwr)
library(epiR)

#https://cran.r-project.org/web/packages/pwr/vignettes/pwr-vignette.html

                          #effect size
#Test	                    small	medium	large
#chi-square tests (chisq)	  0.1	0.3	0.5

#Chi square
pwr.chisq.test(w =0.21, N = , df = 1, sig.level =0.05, power = 0.9)
pwr.chisq.test(w =0.1, N = , df = 1, sig.level =0.05, power = 0.8)
pwr.chisq.test(w =0.2, N = , df = 1, sig.level =0.05, power = 0.9)
pwr.chisq.test(w =0.2, N = , df = 1, sig.level =0.05, power = 0.8)
pwr.chisq.test(w =0.3, N = , df = 1, sig.level =0.05, power = 0.8)
pwr.chisq.test(w =0.3, N = , df = 1, sig.level =0.05, power = 0.9)
pwr.chisq.test(w =0.5, N = , df = 1, sig.level =0.05, power = 0.8)
pwr.chisq.test(w = , N = 225, df = 1, sig.level =0.05, power = 0.9)
pwr.chisq.test(w = , N = 297, df = 1, sig.level =0.05, power = 0.8)
pwr.chisq.test(w = , N = 276, df = 1, sig.level =0.05, power = 0.8)


#T-Test
#Small
pwr.t.test(d=0.2, sig.level=0.05, power=0.80, type="two.sample", alternative="two.sided")

#Medium
pwr.t.test(d=0.5, sig.level=0.05, power=0.80, type="two.sample", alternative="two.sided")

#Large
pwr.t.test(d=0.8, sig.level=0.05, power=0.80, type="two.sample", alternative="two.sided")

#Small
pwr.t.test(d=0.2, sig.level=0.05, power=0.90, type="two.sample", alternative="two.sided")

#Medium
pwr.t.test(d=0.5, sig.level=0.05, power=0.90, type="two.sample", alternative="two.sided")

#Large
pwr.t.test(d=0.8, sig.level=0.05, power=0.90, type="two.sample", alternative="two.sided")

#Back-calculation
pwr.t.test(n=130, d=, sig.level=0.05, power=0.90, type="two.sample", alternative="two.sided")

pwr.t.test(n=130, d=, sig.level=0.05, power=0.80, type="two.sample", alternative="two.sided")


pwr.2p.test(h = ES.h(p1=.50, p2= 0.05), n = 225, sig.level =0.05, power = )

power.prop.test(p1=.50, p2=.25, power=.80) 
pwr.2p.test(h = ES.h(p1=0.10, p2= 0.25), n = , sig.level =0.05, power = 0.8)

pwr.2p.test(h = ES.h(p1=0.1819, p2= 0.10), n = , sig.level =0.05, power = 0.8)
power.prop.test(p1=.1819, p2=.10, power=.80)


library(epiR)
epi.sscc(OR = 2.0, p1 = N, p0 = 0.30, n = NA, power = 0.80, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)$n.total

epi.sscc(OR = 5.0, p1 = N, p0 = 0.30, n = NA, power = 0.80, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)$n.total

##Computer power using OR and sample size
epi.sscc(OR = 8.9, p1 = 0.10, p0 = 0.50, n = 450, power = NA, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)

epi.sscc(OR = 15.8, p1 = 0.45, p0 = 0.05, n = 450, power = NA, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)

epi.sscc(OR = 7.2, p1 = 0.45, p0 = 0.10, n = 450, power = NA, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)

epi.sscc(OR = 12.9, p1 = 0.40, p0 = 0.05, n = 450, power = NA, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)

epi.sscc(OR = 5.8, p1 = 0.40, p0 = 0.10, n = 450, power = NA, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)

epi.sscc(OR = 1.5, p1 = NA, p0 = 0.10, n = 450, power = NA, 
         r = 1, phi.coef = 0, design = 1, sided.test = 2, conf.level = 0.95, 
         method = "unmatched", nfractional = FALSE, fleiss = FALSE)
