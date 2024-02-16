# Java JUnit Sample Application

Based on [junit-sample](https://github.com/QASymphony/junit-sample) repository and
[documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_junit_for_java_with_universal_agent.htm).


## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
On your Host:
1. Install [JDK 17.0.2](https://jdk.java.net/archive/).
2. Install [Maven 3.8.8](https://maven.apache.org/download.cgi).

### Agent Setup
1. **Agent Name**: e.g. _JUnit-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _node_
6. **Working Directory**:
    - _C:\launch-samples\Java-JUnit_ (Windows)
    - _/usr/local/var/launch-samples/Java-JUnit_ (Linux or Mac)
7. **Execute Command**: Both for Windows and Linux/Mac
    ```node
   const { execSync } = require("child_process");
   // if $TESTCASES_AC has values, build command to run tests that match automation content only. Otherwise, execute all the tests.
   let command = `mvn clean test`;
   let testcases_AC = $TESTCASES_AC;
   if (testcases_AC && testcases_AC.length) {
      command = `mvn -Dtest=${testcases_AC} clean test`;
   }
   
   console.log(`=== executing command ===`);
   console.log(command)
   execSync(command, {stdio: "inherit"});
   console.log(`=== command completed ===`)    
   ```
8. **Path to Results**:
    - _C:\launch-samples\Java-JUnit\target\surefire-reports_ (Windows)
    - _/usr/local/var/launch-samples/Java-JUnit/target/surefire-reports_ (Linux or Mac)
9. **Result Parser**: _JUnit for Java_