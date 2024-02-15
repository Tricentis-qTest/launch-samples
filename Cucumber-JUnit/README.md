# Cucumber JUnit Sample Application

Based on [cucumber-sample](https://github.com/QASymphony/cucumber-sample) repository and 
[documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_cucumber_with_universal_agent.htm).

## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
On your Host:
1. Install [JDK 17.0.2](https://jdk.java.net/archive/).
2. Install [Maven 3.8.8](https://maven.apache.org/download.cgi).

### Agent Setup
1. **Agent Name**: e.g. _Cucumber-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _node_
6. **Working Directory**:
    - _C:\launch-sample-applications\Cucumber-JUnit_ (Windows)
    - _/usr/local/var/launch-sample-applications/Cucumber-JUnit_ (Linux or Mac)
7. **Execute Command**: Both for Windows and Linux/Mac
    ```node
    const { execSync } = require("child_process");
    // Automation content is the identifier of an automated Test Run in qTest Manager.
    // We will try to get all automation content(s) of all the test run(s) stored in magic variable TESTCASES_AC, 
    // The value of TESTCASES_AC is under comma separated string, or empty if there is no test runs scheduled to be executed.
    let testcases_AC = $TESTCASES_AC;
    
    // resolve the value of testcases_AC and build command to run scheduled tests, if any
    let cucumberOptions = "--junit,--step-notifications";
    if (testcases_AC && 0 < testcases_AC.length) {
    cucumberOptions += " -n '" + testcases_AC.replace(/,/g, '|') + "'";
    }
    // build command line
    let command = `mvn -Dcucumber.options="${cucumberOptions}" clean test`;
    
    console.log(`=== executing command ===`);
    console.log(command)
    execSync(command, {stdio: "inherit"});
    console.log(`=== command completed ===`)
    ```
8. **Path to Results**:
    - _C:\launch-sample-applications\Cucumber-JUnit\target\surefire-reports_ (Windows)
    - _/usr/local/var/launch-sample-applications\Cucumber-JUnit/target/surefire-reports_ (Linux or Mac)
9. **Result Parser**: _Cucumber JUnit_