Tests and Coverage
================
12 September, 2020 10:57:57

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                         | Coverage (%) |
| :--------------------------------------------- | :----------: |
| slackteams                                     |    40.08     |
| [R/scope\_managment.R](../R/scope_managment.R) |     0.00     |
| [R/set\_methods.R](../R/set_methods.R)         |     0.00     |
| [R/utils.R](../R/utils.R)                      |     0.00     |
| [R/zzz.R](../R/zzz.R)                          |     0.00     |
| [R/team\_managment.R](../R/team_managment.R)   |     9.89     |
| [R/get\_methods.R](../R/get_methods.R)         |    35.42     |
| [R/tidy\_slack.R](../R/tidy_slack.R)           |    36.36     |
| [R/file\_managment.R](../R/file_managment.R)   |    86.67     |
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
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R) | 12 | 0.101 |     0 |      0 |       0 |       0 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R)           |  9 | 0.008 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                                    | context         | test                                              | status | n |  time |
| :---------------------------------------------------------------------- | :-------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L6_L9)   | team management | no active team: get\_team\_creds                  | PASS   | 1 | 0.050 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L13_L16) | team management | no active team: get\_team\_users                  | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L20_L23) | team management | no active team: validate team missing teams error | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L34_L37) | team management | load team: validate team bad name error           | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L41_L43) | team management | load team: activate team                          | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L48_L50) | team management | load team: slackteams to json                     | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L54_L56) | team management | load team: slackteams to dcf                      | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L60_L63) | team management | load team: get teams                              | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L67_L69) | team management | load team: cached slack creds token               | PASS   | 1 | 0.000 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L81)     | team management | active team channel info: validate channel        | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L85)     | team management | active team channel info: validate channel id     | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L89)     | team management | active team channel info: validate bad channel    | PASS   | 1 | 0.015 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L15)               | API calls       | team info: class                                  | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L19)               | API calls       | team info: user names                             | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L27)               | API calls       | converstion info: class                           | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L31)               | API calls       | converstion info: convo id                        | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L35)               | API calls       | converstion info: convo channel count             | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L39)               | API calls       | converstion info: convo im count                  | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L43)               | API calls       | converstion info: convo members                   | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L47)               | API calls       | converstion info: convo info class                | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L51)               | API calls       | converstion info: convo info id                   | PASS   | 1 | 0.001 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                             |                                                                                                                                                                                                                                                                    |
| :------- | :-------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.0.2 (2020-06-22)      |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-apple-darwin17.0 (64-bit) | <a href="https://github.com/yonicd/slackteams/commit/fbab217492ad9d43057b01b7c53df5752d676932/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
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
