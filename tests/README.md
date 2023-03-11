Tests and Coverage
================
11 March, 2023 16:35:27

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                           | Coverage (%) |
| :----------------------------------------------- | :----------: |
| slackteams                                       |    35.15     |
| [R/custom\_app.R](../R/custom_app.R)             |     0.00     |
| [R/scope\_management.R](../R/scope_management.R) |     0.00     |
| [R/set\_methods.R](../R/set_methods.R)           |     0.00     |
| [R/utils.R](../R/utils.R)                        |     0.00     |
| [R/zzz.R](../R/zzz.R)                            |     0.00     |
| [R/team\_management.R](../R/team_management.R)   |     9.47     |
| [R/get\_methods.R](../R/get_methods.R)           |    35.42     |
| [R/tidy\_slack.R](../R/tidy_slack.R)             |    36.36     |
| [R/api.R](../R/api.R)                            |    81.82     |
| [R/file\_management.R](../R/file_management.R)   |    86.67     |
| [R/clean.R](../R/clean.R)                        |    100.00    |
| [R/env.R](../R/env.R)                            |    100.00    |
| [R/has\_methods.R](../R/has_methods.R)           |    100.00    |
| [R/validate.R](../R/validate.R)                  |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                            |  n |  time | error | failed | skipped | warning |
| :-------------------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R) | 14 | 0.558 |     0 |      0 |       0 |       0 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R)           | 21 | 0.366 |     0 |      0 |       0 |       0 |
| [test-03\_has\_methods.R](testthat/test-03_has_methods.R)       |  1 | 0.006 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                                     | context             | test                               | status | n |  time |
| :----------------------------------------------------------------------- | :------------------ | :--------------------------------- | :----- | -: | ----: |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L50_L53)  | 01\_file\_managment | No active team reported gracefully | PASS   | 3 | 0.172 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L67_L70)  | 01\_file\_managment | Loading and saving a team works    | PASS   | 7 | 0.034 |
| [test-01\_file\_managment.R](testthat/test-01_file_managment.R#L98_L103) | 01\_file\_managment | Channel info loads for active team | PASS   | 4 | 0.352 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L49_L54)            | 02\_api\_calls      | User list loads                    | PASS   | 5 | 0.088 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L84_L89)            | 02\_api\_calls      | Conversation list loads            | PASS   | 5 | 0.105 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L119_L124)          | 02\_api\_calls      | Convo info loads                   | PASS   | 6 | 0.089 |
| [test-02\_api\_calls.R](testthat/test-02_api_calls.R#L157_L162)          | 02\_api\_calls      | Convo members load                 | PASS   | 5 | 0.084 |
| [test-03\_has\_methods.R](testthat/test-03_has_methods.R#L5)             | 03\_has\_methods    | Can check for active team.         | PASS   | 1 | 0.006 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                         |                                                                                                                                                                                                                                                                    |
| :------- | :---------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Version  | R version 4.2.2 (2022-10-31)  |                                                                                                                                                                                                                                                                    |
| Platform | x86\_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/slackteams/commit/117caa79bf9291ac5cc6c6c440bf832ac174159a/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.2 LTS            |                                                                                                                                                                                                                                                                    |
| Language | C                             |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                           |                                                                                                                                                                                                                                                                    |

| Package  | Version |
| :------- | :------ |
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>

<!--- Final Status : pass --->
