# JMeter Test Framework

## Command Line Instructions:

`paht/to/jmeter -n -t Users.jmx` 

## Set Up Machine

Install Apache JMeter from [https://jmeter.apache.org/download\_jmeter.cgi](https://jmeter.apache.org/download_jmeter.cgi)

## How to use sample package to integrate with Universal Agent of qTest Automation Host

Execute Command sample: `/path/to/jmeter -n -f -t Users.jmx -l results/result.xml -Jjmeter.save.saveservice.output_format=xml -Jjmeter.save.saveservice.response_data.on_error=true`

Refer to https://jmeter.apache.org/usermanual/listeners.html for more information of command line options.

![Agent Configuration](/JMeter-with-Universal-Agent.png?raw=true)
