# Postman Json Sample Application

Based on [archive-postman-sample](https://github.com/Tricentis-qTest/archive-postman-samples) repository and
[documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_postman_with_universal_agent.htm).

## Testing Automation Host integration with Launch

### Prerequisites
On your Host:
1. Install [Newman](https://learning.postman.com/docs/collections/using-newman-cli/installing-running-newman/),
a command-line Collection Runner for Postman.


### Agent Setup
1. **Agent Name**: e.g. _Postman-Json-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _batch_ (Windows) or _shell_ (Linux or Mac)
6. **Working Directory**: 
   - _C:\launch-samples\Postman-Json_ (Windows)
   - _/usr/local/var/launch-samples/Postman-Json_ (Linux or Mac)
7. **Execute Command**: Both for Windows and Linux/Mac
    ```shell
    newman run "./sample-collection.json" --reporters cli,json --reporter-json-export "./results/sample-results.json" --suppress-exit-code
    ```
8. **Path to Results**:
   - _C:\launch-samples\Postman-Json\results\sample-results.json_ (Windows)
   - _/usr/local/var/launch-samples/Postman-Json/results/sample-results.json_ (Linux or Mac)
9. **Result Parser**: _Postman Json_