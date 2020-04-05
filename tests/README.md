Tests and Coverage
================
05 April, 2020 17:23:20

  - [Coverage](#coverage)
  - [Unit Tests](#unit-tests)

This output is created by
[covrpage](https://github.com/metrumresearchgroup/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

| Object                                         | Coverage (%) |
| :--------------------------------------------- | :----------: |
| slackteams                                     |    39.54     |
| [R/scope\_managment.R](../R/scope_managment.R) |     0.00     |
| [R/set\_methods.R](../R/set_methods.R)         |     0.00     |
| [R/get\_methods.R](../R/get_methods.R)         |    14.29     |
| [R/team\_managment.R](../R/team_managment.R)   |    18.03     |
| [R/validate.R](../R/validate.R)                |    26.32     |
| [R/api.R](../R/api.R)                          |    29.41     |
| [R/tidy\_slack.R](../R/tidy_slack.R)           |    36.84     |
| [R/file\_managment.R](../R/file_managment.R)   |    76.36     |
| [R/slackrapp.R](../R/slackrapp.R)              |    80.00     |
| [R/api\_utils.R](../R/api_utils.R)             |    100.00    |
| [R/clean.R](../R/clean.R)                      |    100.00    |
| [R/env.R](../R/env.R)                          |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                     | n |  time | error | failed | skipped | warning |
| :------------------------------------------------------- | -: | ----: | ----: | -----: | ------: | ------: |
| [test-file\_managment.R](testthat/test-file_managment.R) | 8 | 0.656 |     0 |      0 |       0 |       0 |

<details closed>

<summary> Show Detailed Test Results </summary>

| file                                                             | context         | test                                  | status | n |  time |
| :--------------------------------------------------------------- | :-------------- | :------------------------------------ | :----- | -: | ----: |
| [test-file\_managment.R](testthat/test-file_managment.R#L6_L8)   | team management | load team: slackteams verbose         | PASS   | 1 | 0.003 |
| [test-file\_managment.R](testthat/test-file_managment.R#L12_L14) | team management | load team: slackteams not verbose     | PASS   | 1 | 0.001 |
| [test-file\_managment.R](testthat/test-file_managment.R#L18_L20) | team management | load team: activate team              | PASS   | 1 | 0.560 |
| [test-file\_managment.R](testthat/test-file_managment.R#L25_L27) | team management | load team: slackteams to dcf          | PASS   | 1 | 0.013 |
| [test-file\_managment.R](testthat/test-file_managment.R#L31_L33) | team management | load team: slackteams to dcf          | PASS   | 1 | 0.074 |
| [test-file\_managment.R](testthat/test-file_managment.R#L37_L40) | team management | load team: get teams                  | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L44_L46) | team management | load team: cached slack creds channel | PASS   | 1 | 0.002 |
| [test-file\_managment.R](testthat/test-file_managment.R#L50_L52) | team management | load team: cached slack creds token   | PASS   | 1 | 0.001 |

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
| covr     | 3.3.0   |
| covrpage | 0.0.70  |

</details>

<!--- Final Status : pass --->
