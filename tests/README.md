Tests and Coverage
================
08 April, 2020 06:46:23

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                         | Coverage (%) |
| :--------------------------------------------- | :----------: |
| slackteams                                     |    47.53     |
| [R/scope\_managment.R](../R/scope_managment.R) |     0.00     |
| [R/set\_methods.R](../R/set_methods.R)         |     0.00     |
| [R/team\_managment.R](../R/team_managment.R)   |    18.03     |
| [R/get\_methods.R](../R/get_methods.R)         |    24.49     |
| [R/tidy\_slack.R](../R/tidy_slack.R)           |    36.84     |
| [R/api.R](../R/api.R)                          |    41.18     |
| [R/file\_managment.R](../R/file_managment.R)   |    76.36     |
| [R/slackrapp.R](../R/slackrapp.R)              |    80.00     |
| [R/api\_utils.R](../R/api_utils.R)             |    100.00    |
| [R/clean.R](../R/clean.R)                      |    100.00    |
| [R/env.R](../R/env.R)                          |    100.00    |
| [R/validate.R](../R/validate.R)                |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                     |  n |  time | error | failed | skipped | warning |
| :------------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-api\_calls.R](testthat/test-api_calls.R)           |  2 | 0.016 |     0 |      0 |       0 |       0 |
| [test-file\_managment.R](testthat/test-file_managment.R) | 14 | 3.159 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                             | context         | test                                           | status | n |  time |
| :--------------------------------------------------------------- | :-------------- | :--------------------------------------------- | :----- | -: | ----: |
| [test-api\_calls.R](testthat/test-api_calls.R#L8)                | API calls       | team info: class                               | PASS   | 1 | 0.014 |
| [test-api\_calls.R](testthat/test-api_calls.R#L12)               | API calls       | team info: user names                          | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L6_L9)   | team management | load team: validate team missing teams error   | PASS   | 1 | 0.010 |
| [test-file\_managment.R](testthat/test-file_managment.R#L13_L15) | team management | load team: slackteams verbose                  | PASS   | 1 | 0.003 |
| [test-file\_managment.R](testthat/test-file_managment.R#L19_L22) | team management | load team: validate team bad name error        | PASS   | 1 | 0.007 |
| [test-file\_managment.R](testthat/test-file_managment.R#L26_L28) | team management | load team: slackteams not verbose              | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L32_L34) | team management | load team: activate team                       | PASS   | 1 | 3.115 |
| [test-file\_managment.R](testthat/test-file_managment.R#L39_L41) | team management | load team: slackteams to dcf                   | PASS   | 1 | 0.004 |
| [test-file\_managment.R](testthat/test-file_managment.R#L45_L47) | team management | load team: slackteams to dcf                   | PASS   | 1 | 0.003 |
| [test-file\_managment.R](testthat/test-file_managment.R#L51_L54) | team management | load team: get teams                           | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L58_L60) | team management | load team: cached slack creds channel          | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L64_L66) | team management | load team: cached slack creds token            | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L76)     | team management | active team channel info: validate channel     | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L82)     | team management | active team channel info: class                | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L86)     | team management | active team channel info: validate channel id  | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L90)     | team management | active team channel info: validate bad channel | PASS   | 1 | 0.008 |

</details>

<details>

<summary> Session Info </summary>

| Field    | Value                               |
| :------- | :---------------------------------- |
| Version  | R version 3.6.3 (2020-02-29)        |
| Platform | x86\_64-apple-darwin15.6.0 (64-bit) |
| Running  | macOS Mojave 10.14.5                |
| Language | en\_US                              |
| Timezone | America/New\_York                   |

| Package  | Version |
| :------- | :------ |
| testthat | 2.3.2   |
| covr     | 3.5.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
