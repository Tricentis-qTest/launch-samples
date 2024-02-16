# JMeter Sample Application

Based on [jmeter-sample](https://github.com/QASymphony/jmeter-sample) repository and
[documentation](https://documentation.tricentis.com/qtest/od/en/content/launch/automation_host/universal_agent/parsers/integrate_jmeter_with_universal_agent.htm).

## Testing Host (automation) integrated with Launch (automation-hub)

### Prerequisites
1. Install [JDK 17.0.2](https://jdk.java.net/archive/).
2. Install 4. Install [JMeter 5.6.3](https://jmeter.apache.org/download_jmeter.cgi). Make sure to remember the installation path,
   you will need it in the Agent setup.

### Agent Setup
1. **Agent Name**: e.g. _JMeter-Agent_
2. **qTest Manager Project**: e.g. _Sample Project_
3. **Agent Type**: _Universal Agent_
4. **Pre-Execute-Script**: Leave empty.
5. **Executor**: _batch_ (Windows) or _shell_ (Linux or Mac)
6. **Working Directory**:
    - _C:\launch-samples\JMeter_ (Windows)
    - _/usr/local/var/launch-samples/JMeter_ (Linux or Mac)
7. **Execute Command**: 
    ```shell
    /usr/local/opt/apache-jmeter-5.6.3/bin/jmeter -n -t Users.jmx -l results/result.xml -Jjmeter.save.saveservice.output_format=xml -Jjmeter.save.saveservice.response_data.on_error=true
    ```
   > Adjust the path to JMeter executable to reflect the actual path in your host machine. For example on Windows to `C:\apache-jmeter-5.6.3\bin\jmeter`.
    
8. **Path to Results**:
    - _C:\launch-samples\JMeter\results_ (Windows)
    - _/usr/local/var/launch-samples/JMeter/results_ (Linux or Mac)
9. **Result Parser**: _JUnit for Java_
