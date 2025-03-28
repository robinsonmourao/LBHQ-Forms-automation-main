# Install Python
https://www.python.org/downloads/

# Install pip
## Clone the project
`<pj repository link here>`
## Install SeleniumLibrary
`pip install robotframework-seleniumlibrary`
~~## Install FakerLibrary~~
~~`pip install robotframework-faker`~~

# Install chromedriver
Choose the same regular chrome version installed on your end.
https://googlechromelabs.github.io/chrome-for-testing/
## Paste chromedriver.exe on the Python's Script
https://gyazo.com/815dbb885ac020716b103c1485cff236

# Open the project path
`cd "project-path"`

# Run the project
`robot "<project-name>.robot"`
OR instal vscode extension via marketplace (you can run on the Play button): 
`robocorp.robotframework-lsp`

# Locations
/resources -> Configuration's files to manage the project
  ├── keywords.robot
  └── variables.robot
/scenarios -> Global test's scenarios
  └── scenarios description
/reports
  ├── log.html
  ├── output.xml
  └── report.html