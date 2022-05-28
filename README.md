
<!-- README.md is generated from README.Rmd. Please edit that file -->

# slackteams

<!-- badges: start -->

[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2020_08_13-brightgreen.svg)](http://tinyurl.com/qq3vz59)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-win build
status](https://github.com/yonicd/slackteams/workflows/R-win/badge.svg)](https://github.com/yonicd/slackteams)
[![R-mac build
status](https://github.com/yonicd/slackteams/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackteams)
[![R-linux build
status](https://github.com/yonicd/slackteams/workflows/R-linux/badge.svg)](https://github.com/yonicd/slackteams)
[![Codecov test
coverage](https://codecov.io/gh/yonicd/slackteams/branch/master/graph/badge.svg)](https://codecov.io/gh/yonicd/slackteams?branch=master)
<!-- badges: end -->

`slackteams` is a part of `slackverse`

|                                                                                                                                 |                                                                                                                           |                                                                                                                              |
| :-----------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------: |
|                                                                                                                                 | slackcalls<br>[![](https://github.com/yonicd/slackcalls/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackcalls) |                                                                                                                              |
| slackthreads<br>[![](https://github.com/yonicd/slackthreads/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackthreads) | slackteams<br>[![](https://github.com/yonicd/slackteams/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackteams) |  slackposts<br>[![](https://github.com/yonicd/slackposts/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackposts)   |
|                                                                                                                                 |                                                                                                                           | slackblocks<br>[![](https://github.com/yonicd/slackblocks/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackblocks) |
|                                                                                                                                 |                                                                                                                           | slackreprex<br>[![](https://github.com/yonicd/slackreprex/workflows/R-mac/badge.svg)](https://github.com/yonicd/slackreprex) |

`slackteams` is an `R` package that allows the user to manage multiple
Slack teams during a session.

## Installation

``` r
remotes::install_github("yonicd/slackteams")
```

## Tokens

Creating a token is simple using

``` r
slackteams::add_team_interactive()
```

This will generate a minimal Slack api token for you to interact with
the Slack. For more information on the different permissions the token
can take refer to the [Managing Tokens Vignette](https://yonicd.github.io/slackteams/articles/scopes.html)

The token team will be created, loaded and activated for you, so you can
start working right away. To store this token for future sessions refer
to [Storing A Token](https://yonicd.github.io/slackteams/articles/manage.html#storing-a-token).

## Basic Usage

``` r
library(slackteams)
```

### Load the teams

``` r
slackteams::load_teams()
# The following teams are loaded:
#   slackr, R4ds
```

### Activate a Team

``` r
slackteams::activate_team('R4ds')
# slack environment variables are set to 'R4ds' supplied definitions
```

### Query Active Team Channels

``` r
slackteams::get_team_channels()
```

### Query Active Team Members

``` r
slackteams::get_team_users()
```

### Activate Another Team

``` r
slackteams::activate_team('slackr')
# slack environment variables are set to 'slackr' supplied definitions
```
