# Install Python
https://www.python.org/downloads/

## Clone the project
`https://github.com/robinsonmourao/LBHQ-Forms-automation-main`

# WINDOWS
## Install SeleniumLibrary
`pip install robotframework-seleniumlibrary openpyxl pandas`
## Install chromedriver
Choose the same regular chrome version installed on your end.
https://googlechromelabs.github.io/chrome-for-testing/
### Paste chromedriver.exe on the Python's Script
https://gyazo.com/815dbb885ac020716b103c1485cff236

# LINUX
## Install pip
`sudo apt install python3-pip`
### Install the library
`pip install robotframework-seleniumlibrary openpyxl pandas --break-system-packages`


### To generage field values randomly (Optional)
`pip install robotframework-faker --break-system-packages`


# Open the project path
`cd "project-path"`

# Run the project
`robot "<project-name>.robot"`
OR instal vscode extension via marketplace (you can run on the Play button): 
`robocorp.robotframework-lsp`

# Locations
/resources -> Configuration's files to manage the project<br>
  ├── keywords.robot<br>
  └── variables.robot<br>
/scenarios -> Global test's scenarios<br>
  └── scenarios description<br>
/reports<br>
  ├── log.html<br>
  ├── output.xml<br>
  └── report.html<br>