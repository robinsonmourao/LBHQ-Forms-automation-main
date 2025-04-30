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

# Project Structure
- └── /.vscode  
  - └── (Non-used)

- └── /global-resources  
  - ├── global-keywords.robot — Shared project-wide keywords  
  - ├── global-variables.robot — Shared project-wide variables  
  - └── matrix.robot — Global CSS mapping selectors and Values

- └── /qa  
  - └── /*dealer-name  
    - ├── /resources  
      - ├── keywords.robot — QA-specific keywords for the dealer  
      - └── variables.robot — QA-specific variables for the dealer  
    - └── /(scenario-folder)
      - └── (scenarioXX-description).robot  

- └── /production  
  - └── /*dealer-name
    - ├── /resources  
      - ├── keywords.robot — Prod-specific keywords for the dealer  
      - └── variables.robot — Prod-specific variables for the dealer
    - └── /(scenario-folder)
      - └── (scenarioXX-description).robot  

- /utils  
  - ├── xcelFormScanner.py — Excel parser algorithm  
  - └── __pycache__  

- /reports  
  - ├── log.html  
  - ├── output.xml  
  - └── report.html
