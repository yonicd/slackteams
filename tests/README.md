Tests and Coverage
================
10 August, 2020 00:44:14

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                         | Coverage (%) |
| :--------------------------------------------- | :----------: |
| slackteams                                     |    47.28     |
| [R/scope\_managment.R](../R/scope_managment.R) |     0.00     |
| [R/set\_methods.R](../R/set_methods.R)         |     0.00     |
| [R/utils.R](../R/utils.R)                      |     0.00     |
| [R/team\_managment.R](../R/team_managment.R)   |    11.83     |
| [R/get\_methods.R](../R/get_methods.R)         |    35.71     |
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

| file                                                            |  n |  time | error | failed | skipped | warning |
| :-------------------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R) | 15 | 0.467 |     0 |      0 |       0 |       0 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R)           | 13 | 0.014 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                                    | context         | test                                              | status | n |  time |
| :---------------------------------------------------------------------- | :-------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L6_L9)   | team management | no active team: get\_team\_creds                  | PASS   | 1 | 0.054 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L13_L16) | team management | no active team: get\_team\_users                  | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L20_L23) | team management | no active team: validate team missing teams error | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L31_L33) | team management | load team: slackteams verbose                     | PASS   | 1 | 0.003 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L37_L40) | team management | load team: validate team bad name error           | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L44_L46) | team management | load team: slackteams not verbose                 | PASS   | 1 | 0.003 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L50_L52) | team management | load team: activate team                          | PASS   | 1 | 0.350 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L64_L66) | team management | load team: slackteams to dcf                      | PASS   | 1 | 0.010 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L70_L72) | team management | load team: slackteams to dcf                      | PASS   | 1 | 0.003 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L76_L79) | team management | load team: get teams                              | PASS   | 1 | 0.003 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L89_L91) | team management | load team: cached slack creds token               | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L105)    | team management | active team channel info: validate channel        | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L111)    | team management | active team channel info: class                   | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L115)    | team management | active team channel info: validate channel id     | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L119)    | team management | active team channel info: validate bad channel    | PASS   | 1 | 0.009 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L18)               | API calls       | team info: class                                  | PASS   | 1 | 0.002 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L22)               | API calls       | team info: user names                             | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L30)               | API calls       | group info: group list                            | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L34)               | API calls       | group info: class                                 | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L42)               | API calls       | channel info: class                               | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L46)               | API calls       | channel info: channel names                       | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L54)               | API calls       | converstion info: class                           | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L58)               | API calls       | converstion info: convo id                        | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L62)               | API calls       | converstion info: convo channel count             | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L66)               | API calls       | converstion info: convo im count                  | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L70)               | API calls       | converstion info: convo members                   | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L74)               | API calls       | converstion info: convo info class                | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L78)               | API calls       | converstion info: convo info id                   | PASS   | 1 | 0.001 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                             |                                                                                                                                                                                                                                                                    |
| :------- | :-------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.0.2 (2020-06-22)      |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-apple-darwin17.0 (64-bit) | <a href="https://github.com/yonicd/slackteams/commit/7c07b08479c372d71d977b2c50fafd49a5016f74/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | macOS Catalina 10.15.6            |                                                                                                                                                                                                                                                                    |
| Language | en\_US                            |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                               |                                                                                                                                                                                                                                                                    |

| Package  | Version |
| :------- | :------ |
| testthat | 2.3.2   |
| covr     | 3.3.2   |
| covrpage | 0.0.71  |

</details>

<!--- Final Status : pass --->
