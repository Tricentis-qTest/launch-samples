# NUnit Sample Application

Based on [dotnet-samples](https://github.com/QASymphony/dotnet-samples) repository
and [documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_nunit_test_with_universal_agent.htm).

## Testing Automation Host integration with Launch

### Prerequisites
On your Host:
1. Install [.NET 2.2](https://dotnet.microsoft.com/en-us/download/dotnet) (Agent Setup for Linux expects `dotnet` installed in `/usr/local/bin/`)

### Agent Setup
1. **Agent Name**: e.g. _NUnit-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _node_
6. **Working Directory**:
    - _C:\launch-samples\NUnit_ (Windows)
    - _/usr/local/var/launch-samples/NUnit_ (Linux or Mac)
7. **Execute Command**:
   ```node
   // sample Execute Command for executing .NET core test with node executor

   const fs = require('fs');
   const path = require('path');
   const { execSync } = require('child_process');
   
   let isWin = process.platform == "win32";
   
   // process.env.WORKING_DIR holds the value of Working Directory configured in Universal Agent,
   // if you did not specify Working Directory in Universal Agent, make sure you enter it here
   let SOLUTION_DIR = process.env.WORKING_DIR || ``;
   // validate the existence of SOLUTION_DIR, it it does not exist, print error and stop execution
   if (!fs.existsSync(SOLUTION_DIR)) {
      console.error('No working directory found.');
      return;
   }
   
   // change .NET core version to fit your need
   let TARGET_DOTNETCORE_VERSION = '2.2';
   
   // path to test project, change it to reflect yours
   let TEST_PROJECT_NAME = 'NUnitTestSample';
   let TEST_PROJECT_DIR = path.resolve(SOLUTION_DIR, 'DotnetCore', TEST_PROJECT_NAME);
   let TEST_PROJECT_PATH = path.resolve(TEST_PROJECT_DIR, `${TEST_PROJECT_NAME}.csproj`);
   
   // possible value for configuration: Debug or Release
   let CONFIGURATION = 'Debug';
   // we are going to execute published test
   let PUBLISH_DIR = path.resolve(TEST_PROJECT_DIR, 'bin', CONFIGURATION, `netcoreapp${TARGET_DOTNETCORE_VERSION}`, 'publish');
   // path to the test project output
   let TEST_PROJECT_PUBLISHED_PATH = path.resolve(PUBLISH_DIR, `${TEST_PROJECT_NAME}.dll`);
   
   // this is the full path to dotnet command
   // make sure you change it to reflect your environment
   let DOTNET_EXECUTABLE_PATH = isWin ? 'C:/Program Files/dotnet/dotnet.exe' : '/usr/local/bin/dotnet';
   
   // by default, the result folder will be created at ${SOLUTION_DIR}/TestResults
   let RESULT_DIR = path.resolve(`${SOLUTION_DIR}`, 'TestResults');
   // this is the path to XML test result
   let PATH_TO_XML_RESULT = path.resolve(`${RESULT_DIR}`, 'Results.xml');
   
   // delete result dir if it exists
   if (fs.existsSync(RESULT_DIR)) {
      if (isWin) {
         execSync(`rmdir /s /q "${RESULT_DIR}"`);
      } else {
         execSync(`rm -rf "${RESULT_DIR}"`);
      }
   }
   
   // the shell command builder
   var commandBuilder = [];
   // set DOTNET_CLI_HOME environment var to working directory for dotnet command to work properly
   if (!isWin) {
      commandBuilder.push(`export DOTNET_CLI_HOME="${SOLUTION_DIR}"`);
   }
   
   // execute `dotnet publish` command to publish the test project,
   // the published results will be stored in PUBLISH_DIR
   commandBuilder.push(`"${DOTNET_EXECUTABLE_PATH}" publish "${TEST_PROJECT_PATH}"`);
   
   /**
     * Kicks off the test. What it does is to resolve the value of TESTCASES_AC variable and validate:
       * Case 1: if that variable TESTCASES_AC has value, meaning there is/are test run(s) being scheduled in qTest Manager
       *  -- for each test run being scheduled, finds and executes test method whose name matches that test run's automation content
       * Case 2: the value of TESTCASES_AC is empty, meaning no test runs being scheduled when the Universal Agent is executed in the first time
       *  -- executes all the tests within the project output DLL
       */
   let testMethods = ($TESTCASES_AC && $TESTCASES_AC.trim() != '') ? `/Tests:${TESTCASES_AC}` : ``;
   if (testMethods != '') {
        // run specific test methods, change the log file path if possible
        commandBuilder.push(`"${DOTNET_EXECUTABLE_PATH}" vstest "${TEST_PROJECT_PUBLISHED_PATH}" ${testMethods} --logger:"nunit;LogFilePath=${PATH_TO_XML_RESULT}"`);
   } else {
        // run all tests, change the log file path if possible
        commandBuilder.push(`"${DOTNET_EXECUTABLE_PATH}" vstest "${TEST_PROJECT_PUBLISHED_PATH}" --logger:"nunit;LogFilePath=${PATH_TO_XML_RESULT}"`);
   }
   
   // the dotnet test runner will throw exception when there is an assertion failed and causes the
   // test exited with code 1. So we wrap the command execution in a try catch block to ensure the
   // execute command is fully executed and not exited with code 1 when there is exception thrown from the test
   try {
      // build the shell command
      let command = isWin ? commandBuilder.join(' && ') : commandBuilder.join('\n');
      // execute the shell command
      execSync(command, { stdio: "inherit" });
   } catch (err) {
      console.error(`*** Test execution error ***`);
      console.error(err.message || err);
      console.error(`*** End test execution error ***`);
   }
   ```
8. **Path to Results**:
    - _C:\launch-samples\NUnit\TestResults_ (Windows)
    - _/usr/local/var/launch-samples/NUnit/TestResults_ (Linux or Mac)
9. **Result Parser**: _NUnit_