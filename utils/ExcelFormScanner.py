import pandas as pd

class ExcelFormScanner:
    def __init__(self):
        self.df = None

    def load_spreadsheet(self, file_path):
        self.df = pd.read_excel(file_path)

    def get_form_url_map(self):
        url_map = {}
        if "Has a Form?*" not in self.df.columns or "URL" not in self.df.columns or "Pages" not in self.df.columns:
            raise ValueError("Expected columns: 'Has a Form?*', 'URL', and 'Pages'")
        
        for _, row in self.df.iterrows():
            if str(row["Has a Form?*"]).strip().lower() == "yes":
                url = row["URL"]
                page = row["Pages"]
                url_map[url] = page
        return url_map

