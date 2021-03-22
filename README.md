# RobotFramework_Appium_Demo
Automation Sample Mobile application using RobotFramework, Appium, and Python

## Requirements

- Python 3.7 or greater

Download Python from https://www.python.org/ 

# Setup Environment variables
System variables
PYTHON_HOME=Path to Python 3+ folder

Add below in path variable under System Variables
%PYTHON_HOME%\Lib;%PYTHON_HOME%\DLLs;%PYTHON_HOME%\Lib\lib-tk;%PYTHON_HOME%\Scripts;

Download Android SDk (Android Studio) and add SDK Path to Environment variables, Chech below links for more

https://www3.ntu.edu.sg/home/ehchua/programming/android/Android_HowTo.html

https://www.360logica.com/blog/how-to-set-path-environmental-variable-for-sdk-in-windows/

open terminal or cmd and enter adb devices command

# Build project
Download or Clone the project and Navigate to RobotFramework_Appium_Demo project directory

In order to build the project execute the following command in cmd or terminal

for Windows:

```
build.bat
```

for mac:
```
sh build.sh
```

# Execute testcases


In order to execute testcases the following command in cmd or terminal

```
RunUITests.bat
```

# Remote Execution

For BrowserStack:
Add ${USER} and ${KEY} in remote_variables.robot and set flag Yes for ${REMOTE_MOBILE_EXECUTION}


# References 

Practice App: weShop.apk

Robotframework Metrics Reports: https://github.com/adiralashiva8/robotframework-metrics

Pabot: https://github.com/mkorpela/pabot -Parallel execution

Allure reports: https://github.com/allure-framework/allure-python/tree/master/allure-robotframework




