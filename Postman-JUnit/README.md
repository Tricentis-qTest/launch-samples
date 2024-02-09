# Postman JUnit Sample Application

Based on [archive-postman-sample](https://github.com/Tricentis-qTest/archive-postman-samples) repository and
[documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_postman_with_universal_agent.htm).

## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
On your Host:
1. Copy the _archive-postman-samples_ folder to your desired location, e.g.:
    - _/usr/local/var/archive-postman-samples_ (Linux or Mac)
    - _C:\archive-postman-samples_ (Windows)
2. Install [Newman](https://learning.postman.com/docs/collections/using-newman-cli/installing-running-newman/),
   a command-line Collection Runner for Postman.


### Agent Setup
1. **Agent Name**: e.g. _Postman-JUnit-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _batch_ (Windows) or _shell_ (Linux or Mac)
6. **Working Directory**:
    - _C:\archive-postman-samples_ (Windows)
    - _/usr/local/var/archive-postman-samples_ (Linux or Mac)
7. **Execute Command**: Both for Windows and Linux/Mac
    ```bash
    newman run "./sample-collection.json" --reporters cli,junit --reporter-junit-export "./results/sample-results.xml" --suppress-exit-code    
    ```
8. **Path to Results**:
    - _C:\archive-postman-samples\results\sample-results.xml_ (Windows)
    - _/usr/local/var/archive-postman-samples/results/sample-results.xml_ (Linux or Mac)
9. **Result Parser**: _Postman JUnit_