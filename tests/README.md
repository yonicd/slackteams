Tests and Coverage
================
03 February, 2023 22:19:04

- <a href="#coverage" id="toc-coverage">Coverage</a>
- <a href="#unit-tests" id="toc-unit-tests">Unit Tests</a>

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                          | Coverage (%) |
|:------------------------------------------------|:------------:|
| slackteams                                      |    35.15     |
| [R/custom_app.R](../R/custom_app.R)             |     0.00     |
| [R/scope_management.R](../R/scope_management.R) |     0.00     |
| [R/set_methods.R](../R/set_methods.R)           |     0.00     |
| [R/utils.R](../R/utils.R)                       |     0.00     |
| [R/zzz.R](../R/zzz.R)                           |     0.00     |
| [R/team_management.R](../R/team_management.R)   |     9.47     |
| [R/get_methods.R](../R/get_methods.R)           |    35.42     |
| [R/tidy_slack.R](../R/tidy_slack.R)             |    36.36     |
| [R/api.R](../R/api.R)                           |    81.82     |
| [R/file_management.R](../R/file_management.R)   |    86.67     |
| [R/clean.R](../R/clean.R)                       |    100.00    |
| [R/env.R](../R/env.R)                           |    100.00    |
| [R/has_methods.R](../R/has_methods.R)           |    100.00    |
| [R/validate.R](../R/validate.R)                 |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                          |   n |  time | error | failed | skipped | warning |
|:--------------------------------------------------------------|----:|------:|------:|-------:|--------:|--------:|
| [test-01_file_managment.R](testthat/test-01_file_managment.R) |  12 | 0.072 |     0 |      0 |       0 |       0 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R)           |   9 | 0.013 |     0 |      0 |       0 |       0 |
| [test-03_has_methods.R](testthat/test-03_has_methods.R)       |   1 | 0.005 |     0 |      0 |       0 |       0 |

<details closed>
<summary>
Show Detailed Test Results
</summary>

| file                                                                  | context         | test                                              | status |   n |  time |
|:----------------------------------------------------------------------|:----------------|:--------------------------------------------------|:-------|----:|------:|
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L6_L9)   | team management | no active team: get_team_creds                    | PASS   |   1 | 0.011 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L13_L16) | team management | no active team: get_team_users                    | PASS   |   1 | 0.007 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L20_L23) | team management | no active team: validate team missing teams error | PASS   |   1 | 0.007 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L33_L36) | team management | load team: validate team bad name error           | PASS   |   1 | 0.013 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L40_L42) | team management | load team: activate team                          | PASS   |   1 | 0.002 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L47_L49) | team management | load team: slackteams to json                     | PASS   |   1 | 0.013 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L53_L55) | team management | load team: slackteams to dcf                      | PASS   |   1 | 0.002 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L59_L62) | team management | load team: get teams                              | PASS   |   1 | 0.002 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L66_L68) | team management | load team: cached slack creds token               | PASS   |   1 | 0.004 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L80)     | team management | active team channel info: validate channel        | PASS   |   1 | 0.002 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L84)     | team management | active team channel info: validate channel id     | PASS   |   1 | 0.002 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L88)     | team management | active team channel info: validate bad channel    | PASS   |   1 | 0.007 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L15)               | API calls       | team info: class                                  | PASS   |   1 | 0.002 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L19)               | API calls       | team info: user names                             | PASS   |   1 | 0.002 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L27)               | API calls       | converstion info: class                           | PASS   |   1 | 0.001 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L33_L36)           | API calls       | converstion info: convo id                        | PASS   |   1 | 0.001 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L40)               | API calls       | converstion info: convo channel count             | PASS   |   1 | 0.002 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L44)               | API calls       | converstion info: convo im count                  | PASS   |   1 | 0.001 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L48)               | API calls       | converstion info: convo members                   | PASS   |   1 | 0.002 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L52)               | API calls       | converstion info: convo info class                | PASS   |   1 | 0.001 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L56)               | API calls       | converstion info: convo info id                   | PASS   |   1 | 0.001 |
| [test-03_has_methods.R](testthat/test-03_has_methods.R#L3)            | 03_has_methods  | Can check for active team.                        | PASS   |   1 | 0.005 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                        |                                                                                                                                                                                                                                                                    |
|:---------|:-----------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Version  | R version 4.2.2 (2022-10-31) |                                                                                                                                                                                                                                                                    |
| Platform | x86_64-pc-linux-gnu (64-bit) | <a href="https://github.com/yonicd/slackteams/commit/6506ce2095eb779ff1eb9daa37aeeb0ece26e485/checks" target="_blank"><span title="Built on Github Actions">![](https://github.com/metrumresearchgroup/covrpage/blob/actions/inst/logo/gh.png?raw=true)</span></a> |
| Running  | Ubuntu 22.04.1 LTS           |                                                                                                                                                                                                                                                                    |
| Language | C                            |                                                                                                                                                                                                                                                                    |
| Timezone | UTC                          |                                                                                                                                                                                                                                                                    |

| Package  | Version |
|:---------|:--------|
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>
<!--- Final Status : pass --->
