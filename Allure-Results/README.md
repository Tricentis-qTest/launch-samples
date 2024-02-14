# Allure Results Sample Application

Based on [junit-sample](https://github.com/QASymphony/junit-sample) repository and Allure Report
[documentation](https://allurereport.org/docs/junit4/).

Allure Report can take the results of your JUnit (or other test framework) tests and present them in a more readable format.

## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
On your Host:
1. Install [Java 8](https://jdk.java.net/archive/), sadly you cannot use newer for Allure 1.
2. Install [Maven](https://maven.apache.org/install.html), e.g. use v3.9.6.

### Agent Setup
1. **Agent Name**: e.g. _Allure-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _batch_ (Windows) or _shell_ (Linux or Mac)
6. **Working Directory**:
    - _C:\launch-sample-applications\Allure-Results\allure-junit-sample_ (Windows)
    - _/usr/local/var/launch-sample-applications/Allure-Results/allure-junit-sample_ (Linux or Mac)
7. **Execute Command**:
   ```shell
   mvn clean test
   ```
8. **Path to Results**:
    - _C:\launch-sample-applications\Allure-Results\allure-junit-sample\target\allure-results_ (Windows)
    - _/usr/local/var/launch-sample-applications/Allure-Results/allure-junit-sample/target/allure-results_ (Linux or Mac)
9. **Result Parser**: _Allure Results_
