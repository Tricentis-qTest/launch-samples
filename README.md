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

1. Install [JDK 8](https://jdk.java.net/archive/).
2. Install [Maven](https://maven.apache.org/install.html), e.g. use v3.9.6.
3. Install [JMeter](https://jmeter.apache.org/download_jmeter.cgi), e.g. use v5.6.3. Make sure to remember the installation path,
     you will need it in the Agent setup.
4. Install [.NET 2.2](https://dotnet.microsoft.com/en-us/download/dotnet)
5. Install [Newman](https://learning.postman.com/docs/collections/using-newman-cli/installing-running-newman/),
      a command-line Collection Runner for Postman.
