# launch-sample-applications
Sample applications for testing different types of Agent parses.

## How to use this repository

> Each folder in this repository contains a sample application and a README file with instructions on how to set up an
agent with a parser.

1. Clone this repository to your Host into this specific folder:
   1. `cd C:` (Windows)
   2. `cd /usr/local/var/` (Linux or Mac)
    ```shell
    git clone https://github.com/pavolbaran/launch-sample-applications.git
    ```
   
2. If you want to test all parsers, install the tooling listed bellow. Otherwise, proceed to a specific folder in this
repo and install the tooling required for the parser / sample application you want to use.
3. Start the Host (Automation Host)
4. Create new agent according to the README file in the respective folder.

> Before you start your Host (Automation Host), make sure to install all the prerequisites for the sample application you want to use,
because the Host needs to have available tools such as Maven, JMeter...


## Prerequisites
Each sample application has its own prerequisites which are listed in the respective READMEs. 
For convenience, they are summarize here so that you may install all necessary tooling before setting up the agents.

You may be get away with using newer or older versions but at the time of writing, these versions are known to work.
1. Install [JDK 17.0.2](https://jdk.java.net/archive/).
2. For Allure sample you will need JDK 8, but there is a way to set up the agent without JDK.
3. Install [Maven 3.8.8](https://maven.apache.org/download.cgi).
4. Install [JMeter 5.6.3](https://jmeter.apache.org/download_jmeter.cgi).
5. Install [.NET 2.2](https://dotnet.microsoft.com/en-us/download/dotnet).
6. Install [Newman 6.1.1](https://learning.postman.com/docs/collections/using-newman-cli/installing-running-newman/).
> Verify your installations, e.g. `mvn -v`.

There is a script `install-ubuntu-deps.sh` prepared for debian-based linux which will install/download most of the required tooling.