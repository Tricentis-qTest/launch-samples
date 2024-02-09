# Java JUnit Sample Application

Based on [junit-sample](https://github.com/QASymphony/junit-sample) repository and
[documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_junit_for_java_with_universal_agent.htm).


## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
On your Host:
1. Copy the _junit-sample_ folder to your desired location, e.g.:
    - _/usr/local/var/junit-sample_ (Linux or Mac)
    - _C:\junit-sample_ (Windows)
2. Install [Java 8+](https://jdk.java.net/archive/), e.g. use v13.0.2.
3. Install [Maven](https://maven.apache.org/install.html), e.g. use v3.9.6. Make sure to remember the installation path,
you will need it in the Agent setup.

### Agent Setup
1. **Agent Name**: e.g. _JUnit-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _node_
6. **Working Directory**:
    - _C:\junit-sample_ (Windows)
    - _/usr/local/var/junit-sample_ (Linux or Mac)
7. **Execute Command**: Both for Windows and Linux/Mac
    ```node
   const { execSync } = require("child_process");
   
   // NOTE: change the value to reflect the actual path to maven executable in your host machine
   let mavenExePath = `/usr/local/opt/apache-maven-3.9.6/bin/mvn`;
   
   // if $TESTCASES_AC has values, build command to run tests that match automation content only. Otherwise, execute all the tests.
   let command = `"${mavenExePath}" clean test`;
   let testcases_AC = $TESTCASES_AC;
   if (testcases_AC && testcases_AC.length) {
      command = `"${mavenExePath}" -Dtest=${testcases_AC} clean test`;
   }
   
   console.log(`=== executing command ===`);
   console.log(command)
   execSync(command, {stdio: "inherit"});
   console.log(`=== command completed ===`)    
   ```
8. **Path to Results**:
    - _C:\junit-sample\target\surefire-reports_ (Windows)
    - _/usr/local/var/junit-sample/target/surefire-reports_ (Linux or Mac)
9. **Result Parser**: _JUnit for Java_