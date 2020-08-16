Tests and Coverage
================
16 August, 2020 14:53:15

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                         | Coverage (%) |
| :--------------------------------------------- | :----------: |
| slackteams                                     |    41.89     |
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
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R) | 13 | 0.093 |     0 |      0 |       0 |       0 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R)           | 13 | 0.007 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                                    | context         | test                                              | status | n |  time |
| :---------------------------------------------------------------------- | :-------------- | :------------------------------------------------ | :----- | -: | ----: |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L5_L8)   | team management | no active team: get\_team\_creds                  | PASS   | 1 | 0.045 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L12_L15) | team management | no active team: get\_team\_users                  | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L19_L22) | team management | no active team: validate team missing teams error | PASS   | 1 | 0.009 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L33_L36) | team management | load team: validate team bad name error           | PASS   | 1 | 0.010 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L40_L42) | team management | load team: activate team                          | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L47_L49) | team management | load team: slackteams to json                     | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L53_L55) | team management | load team: slackteams to dcf                      | PASS   | 1 | 0.002 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L59_L62) | team management | load team: get teams                              | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L66_L68) | team management | load team: cached slack creds token               | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L80)     | team management | active team channel info: validate channel        | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L86)     | team management | active team channel info: class                   | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L90)     | team management | active team channel info: validate channel id     | PASS   | 1 | 0.001 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L94)     | team management | active team channel info: validate bad channel    | PASS   | 1 | 0.009 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L18)               | API calls       | team info: class                                  | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L22)               | API calls       | team info: user names                             | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L30)               | API calls       | group info: group list                            | PASS   | 1 | 0.002 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L34)               | API calls       | group info: class                                 | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L42)               | API calls       | channel info: class                               | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L46)               | API calls       | channel info: channel names                       | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L54)               | API calls       | converstion info: class                           | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L58)               | API calls       | converstion info: convo id                        | PASS   | 1 | 0.001 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L62)               | API calls       | converstion info: convo channel count             | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L66)               | API calls       | converstion info: convo im count                  | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L70)               | API calls       | converstion info: convo members                   | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L74)               | API calls       | converstion info: convo info class                | PASS   | 1 | 0.000 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L78)               | API calls       | converstion info: convo info id                   | PASS   | 1 | 0.000 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                             |                                                                                                                                                                                                                                                                    |
| :------- | :-------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.0.2 (2020-06-22)      |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-apple-darwin17.0 (64-bit) | <a href="https://github.com/yonicd/slackteams/commit/116ebbb5aa77b9c36664ceeee80d10391200c8bf/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
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
