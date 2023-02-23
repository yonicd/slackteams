Tests and Coverage
================
23 February, 2023 11:26:39

- <a href="#coverage" id="toc-coverage">Coverage</a>
- <a href="#unit-tests" id="toc-unit-tests">Unit Tests</a>

This output is created by
[covrpage](https://github.com/yonicd/covrpage).

## Coverage

Coverage summary is created using the
[covr](https://github.com/r-lib/covr) package.

    ## - Not All Tests Passed
    ##   Coverage statistics are approximations of the non-failing tests.
    ##   Use with caution
    ## 
    ##  For further investigation check in testthat summary tables.

| Object                                          | Coverage (%) |
|:------------------------------------------------|:------------:|
| slackteams                                      |    33.79     |
| [R/custom_app.R](../R/custom_app.R)             |     0.00     |
| [R/scope_management.R](../R/scope_management.R) |     0.00     |
| [R/set_methods.R](../R/set_methods.R)           |     0.00     |
| [R/utils.R](../R/utils.R)                       |     0.00     |
| [R/zzz.R](../R/zzz.R)                           |     0.00     |
| [R/team_management.R](../R/team_management.R)   |     9.47     |
| [R/get_methods.R](../R/get_methods.R)           |    35.42     |
| [R/tidy_slack.R](../R/tidy_slack.R)             |    36.36     |
| [R/api.R](../R/api.R)                           |    45.45     |
| [R/file_management.R](../R/file_management.R)   |    86.67     |
| [R/clean.R](../R/clean.R)                       |    100.00    |
| [R/env.R](../R/env.R)                           |    100.00    |
| [R/has_methods.R](../R/has_methods.R)           |    100.00    |
| [R/validate.R](../R/validate.R)                 |    100.00    |

<br>

## Unit Tests

Unit Test summary is created using the
[testthat](https://github.com/r-lib/testthat) package.

| file                                                          |   n | time | error | failed | skipped | warning |
|:--------------------------------------------------------------|----:|-----:|------:|-------:|--------:|--------:|
| [test-01_file_managment.R](testthat/test-01_file_managment.R) |  14 | 0.64 |     0 |      0 |       0 |       0 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R)           |   1 | 0.16 |     2 |      0 |       0 |       0 |
| [test-03_has_methods.R](testthat/test-03_has_methods.R)       |   1 | 0.00 |     0 |      0 |       0 |       0 |

<details open>
<summary>
Show Detailed Test Results
</summary>

| file                                                                   | context           | test                               | status |   n | time |
|:-----------------------------------------------------------------------|:------------------|:-----------------------------------|:-------|----:|-----:|
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L50_L53)  | 01_file_managment | No active team reported gracefully | PASS   |   3 | 0.04 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L67_L70)  | 01_file_managment | Loading and saving a team works    | PASS   |   7 | 0.04 |
| [test-01_file_managment.R](testthat/test-01_file_managment.R#L98_L103) | 01_file_managment | Channel info loads for active team | PASS   |   4 | 0.56 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L49_L53)            | 02_api_calls      | User list loads                    | ERROR  |   0 | 0.00 |
| [test-02_api_calls.R](testthat/test-02_api_calls.R#L60_L65)            | 02_api_calls      | Channel info loads                 | ERROR  |   1 | 0.16 |
| [test-03_has_methods.R](testthat/test-03_has_methods.R#L5)             | 03_has_methods    | Can check for active team.         | PASS   |   1 | 0.00 |

</details>
<details>
<summary>
Session Info
</summary>

| Field    | Value                             |
|:---------|:----------------------------------|
| Version  | R version 4.2.2 (2022-10-31 ucrt) |
| Platform | x86_64-w64-mingw32/x64 (64-bit)   |
| Running  | Windows 10 x64 (build 22621)      |
| Language | English_United States             |
| Timezone | America/Chicago                   |

| Package  | Version |
|:---------|:--------|
| testthat | 3.1.6   |
| covr     | 3.6.1   |
| covrpage | 0.2     |

</details>
<!--- Final Status : error/failed --->
