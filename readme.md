## Overview
Robotframework automation suite for testing login functionality of the crf application

## Dependencies
 - Robotframework Docker https://github.com/rsarpal/robot


## Execution
  - Use the following command to run the tests inside the Robotframework Docker
        `robot -d results -v URL:http://<IP>:8080 TestCases/Login/crfui.robot`
  - In the command above set IP address of the crf application.
  - Test suite supports Chrome and Firefox browser which can be passed as a variables to above command
    eg. `robot -d results -v URL:http://<IP>:8080 -v BROWSER:firefox TestCases/Login/crfui.robot`

  - Test is driven by data in CSV file /Data/loginids.csv
