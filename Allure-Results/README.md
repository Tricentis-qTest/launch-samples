# Allure Results Sample Application

Based on [junit-sample](https://github.com/QASymphony/junit-sample) repository and Allure Report
[documentation](https://allurereport.org/docs/junit4/).

Allure Report can take the results of your JUnit (or other test framework) tests and present them in a more readable format.

## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
On your Host:
1. Copy the _allure-junit-sample_ folder to your desired location, e.g.:
    - _/usr/local/var/allure-junit-sample_ (Linux or Mac)
    - _C:\allure-junit-sample_ (Windows)
2. Install [Java 8](https://jdk.java.net/archive/), sadly you cannot use newer for Allure 1.
3. Install [Maven](https://maven.apache.org/install.html), e.g. use v3.9.6.
4. Install [Allure Commandline](https://allurereport.org/docs/gettingstarted-installation/), e.g. use v2.27.0.

### Agent Setup
1. **Agent Name**: e.g. _Allure-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _batch_ (Windows) or _shell_ (Linux or Mac)
6. **Working Directory**:
    - _C:\allure-junit-sample_ (Windows)
    - _/usr/local/var/allure-junit-sample_ (Linux or Mac)
7. **Execute Command**:
   ```shell
   mvn clean test
   ```
8. **Path to Results**:
    - _C:\allure-junit-sample\allure-results_ (Windows)
    - _/usr/local/var/allure-junit-sample/allure-results_ (Linux or Mac)
9. **Result Parser**: _Allure Results_
