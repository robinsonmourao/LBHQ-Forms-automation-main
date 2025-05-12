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
  - ├── helpers.robot — Shared project-wide simple helpers methods
  - └── matrix.robot — Shared project-wide CSS mapping xpaths and Values

- └── /qa  
  - └── /*dealer-name  
    - ├── /resources  
      - ├── _(Spreadsheet Forms) — For every column where 'Has a Form?*' is marked as 'Yes', the column 'URL' will be loaded.
      - ├── validations.robot — QA-specific dealer validations
      - └── variables.robot — QA-specific variables for the dealer  
    - └── /(scenario-folder)
      - └── (scenarioXX-description).robot  

- └── /production  
  - └── /*dealer-name
    - ├── /resources  
      - ├── _(Spreadsheet Forms) — For every column where 'Has a Form?*' is marked as 'Yes', the column 'URL' will be loaded.
      - ├── validations.robot — Prod-specific dealer validations
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
