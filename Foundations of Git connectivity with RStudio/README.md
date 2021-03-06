## How to time travel with your code: Foundations of Git connectivity with RStudio

Gracielle Higino  covers foundations of version control, useful git commands and connections with RStudio.
Contacts
Twitter: @GracielleHigino / graciellehigino@gmail.com
 
# Collaborative notes

[Slides](https://zenodo.org/record/6516065#.YnS_idpBy3A)

[sotware carpentry notes on version control](https://swcarpentry.github.io/git-novice/)  

[usethis package documentation](https://usethis.r-lib.org/)     

[usethis package documentation 2](https://www.rdocumentation.org/packages/usethis/versions/2.1.5)

[emoji guide for commit messages](https://gitmoji.dev/)    

[Configuring notifications](https://docs.github.com/en/account-and-profile/managing-subscriptions-and-notifications-on-github/setting-up-notifications/configuring-notifications)

[Collaboration, Version Control, & GitHub](https://mozillascience.github.io/study-group-orientation/3.1-collab-vers-github.html)

[etherpad](https://etherpad.wikimedia.org/p/r-ladies-git)

## Useful book:
[happygitwithr](https://happygitwithr.com/index.html)
    
## Configuring git with R

install.packages("usethis")
library(usethis)
use_git_config(user.name = "Your Name", user.email = "your@email.org")

# create PAT
usethis::create_github_token()

# store your PAT
gitcreds::gitcreds_set()
