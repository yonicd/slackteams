Tests and Coverage
================
01 June, 2020 20:13:47

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                         | Coverage (%) |
| :--------------------------------------------- | :----------: |
| slackteams                                     |    46.18     |
| [R/scope\_managment.R](../R/scope_managment.R) |     0.00     |
| [R/set\_methods.R](../R/set_methods.R)         |     0.00     |
| [R/utils.R](../R/utils.R)                      |     0.00     |
| [R/team\_managment.R](../R/team_managment.R)   |    11.83     |
| [R/get\_methods.R](../R/get_methods.R)         |    30.61     |
| [R/tidy\_slack.R](../R/tidy_slack.R)           |    36.36     |
| [R/file\_managment.R](../R/file_managment.R)   |    76.36     |
| [R/slackrapp.R](../R/slackrapp.R)              |    80.00     |
| [R/api\_utils.R](../R/api_utils.R)             |    100.00    |
| [R/api.R](../R/api.R)                          |    100.00    |
| [R/clean.R](../R/clean.R)                      |    100.00    |
| [R/env.R](../R/env.R)                          |    100.00    |
| [R/validate.R](../R/validate.R)                |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                     |  n |  time | error | failed | skipped | warning |
| :------------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-api\_calls.R](testthat/test-api_calls.R)           | 16 | 0.042 |     0 |      0 |       0 |       0 |
| [test-file\_managment.R](testthat/test-file_managment.R) | 16 | 0.326 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                             | context         | test                                              | status | n |  time |
| :--------------------------------------------------------------- | :-------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-api\_calls.R](testthat/test-api_calls.R#L19)               | API calls       | team info: class                                  | PASS   | 1 | 0.031 |
| [test-api\_calls.R](testthat/test-api_calls.R#L23)               | API calls       | team info: user names                             | PASS   | 1 | 0.002 |
| [test-api\_calls.R](testthat/test-api_calls.R#L31)               | API calls       | group info: group list                            | PASS   | 1 | 0.002 |
| [test-api\_calls.R](testthat/test-api_calls.R#L35)               | API calls       | group info: class                                 | PASS   | 1 | 0.001 |
| [test-api\_calls.R](testthat/test-api_calls.R#L39)               | API calls       | group info: no groups                             | PASS   | 1 | 0.001 |
| [test-api\_calls.R](testthat/test-api_calls.R#L46)               | API calls       | channel info: class                               | PASS   | 1 | 0.000 |
| [test-api\_calls.R](testthat/test-api_calls.R#L50)               | API calls       | channel info: channel names                       | PASS   | 1 | 0.001 |
| [test-api\_calls.R](testthat/test-api_calls.R#L54)               | API calls       | channel info: channel info class                  | PASS   | 1 | 0.000 |
| [test-api\_calls.R](testthat/test-api_calls.R#L58)               | API calls       | channel info: channel info id                     | PASS   | 1 | 0.000 |
| [test-api\_calls.R](testthat/test-api_calls.R#L65)               | API calls       | converstion info: class                           | PASS   | 1 | 0.000 |
| [test-api\_calls.R](testthat/test-api_calls.R#L69)               | API calls       | converstion info: convo id                        | PASS   | 1 | 0.001 |
| [test-api\_calls.R](testthat/test-api_calls.R#L73)               | API calls       | converstion info: convo channel count             | PASS   | 1 | 0.001 |
| [test-api\_calls.R](testthat/test-api_calls.R#L77)               | API calls       | converstion info: convo im count                  | PASS   | 1 | 0.001 |
| [test-api\_calls.R](testthat/test-api_calls.R#L81)               | API calls       | converstion info: convo members                   | PASS   | 1 | 0.000 |
| [test-api\_calls.R](testthat/test-api_calls.R#L85)               | API calls       | converstion info: convo info class                | PASS   | 1 | 0.000 |
| [test-api\_calls.R](testthat/test-api_calls.R#L89)               | API calls       | converstion info: convo info id                   | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L6_L9)   | team management | no active team: get\_team\_creds                  | PASS   | 1 | 0.010 |
| [test-file\_managment.R](testthat/test-file_managment.R#L13_L16) | team management | no active team: get\_team\_users                  | PASS   | 1 | 0.007 |
| [test-file\_managment.R](testthat/test-file_managment.R#L20_L23) | team management | no active team: validate team missing teams error | PASS   | 1 | 0.007 |
| [test-file\_managment.R](testthat/test-file_managment.R#L31_L33) | team management | load team: slackteams verbose                     | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L37_L40) | team management | load team: validate team bad name error           | PASS   | 1 | 0.007 |
| [test-file\_managment.R](testthat/test-file_managment.R#L44_L46) | team management | load team: slackteams not verbose                 | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L50_L52) | team management | load team: activate team                          | PASS   | 1 | 0.274 |
| [test-file\_managment.R](testthat/test-file_managment.R#L64_L66) | team management | load team: slackteams to dcf                      | PASS   | 1 | 0.003 |
| [test-file\_managment.R](testthat/test-file_managment.R#L70_L72) | team management | load team: slackteams to dcf                      | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L76_L79) | team management | load team: get teams                              | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L83_L85) | team management | load team: cached slack creds channel             | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L89_L91) | team management | load team: cached slack creds token               | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L105)    | team management | active team channel info: validate channel        | PASS   | 1 | 0.000 |
| [test-file\_managment.R](testthat/test-file_managment.R#L111)    | team management | active team channel info: class                   | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L115)    | team management | active team channel info: validate channel id     | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L119)    | team management | active team channel info: validate bad channel    | PASS   | 1 | 0.007 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |                                                                                                                                                                                                                                                                    |
| :------- | :---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Version  | R version 3.6.3 (2020-02-29)        |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) | <a href="https://github.com/yonicd/slackteams/commit/bc6061215245293efd5dd59599e2af05dbf262fc/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | macOS Catalina 10.15.4              |                                                                                                                                                                                                                                                                    |
| Language | en\_US                              |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                                 |                                                                                                                                                                                                                                                                    |

| Package  | Version |
| :------- | :------ |
| testthat | 2.3.2   |
| covr     | 3.3.2   |
| covrpage | 0.0.71  |

</details>

<!--- Final Status : pass --->
