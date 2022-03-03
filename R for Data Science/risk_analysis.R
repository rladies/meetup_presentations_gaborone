##Risk analysis a distribution of outcomes. In this case,
# each line represents the predicted return on investment 
# based on different series of inputs.

install.packages('tidyverse')
library(tidyverse)

RUNS <- 5            #executes 50 runs of the model
DECISION.STEPS <- 10  #twelve discrete time periods

calculate_return <- function(alpha) {
  risk_free_rate <- 1.03
  risky_rate <- rnorm(1) * 0.05 + 1
  (1 - alpha) * risk_free_rate + alpha * risky_rate
}

simulations <- rerun(RUNS, replicate(DECISION.STEPS, #rerun generating sample data.
                                     runif(1) %>% 
                                 calculate_return())) %>%
  set_names(paste0("sim", 1:RUNS)) %>%
  map(~ accumulate(., ~ .x * .y)) %>%
  map_dfr(~ tibble(value = .x, step = 1:DECISION.STEPS), 
          .id = "simulation")

simulations %>%
  ggplot(aes(x = step, y = value)) +
  geom_line(aes(color = simulation)) +
  theme(legend.position = "none") +
  ggtitle("Simulations of returns from asset allocation")


