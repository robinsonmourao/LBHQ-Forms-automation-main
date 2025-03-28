import pandas as pd

class ExcelFormScanner:
    def __init__(self):
        self.df = None

    def load_spreadsheet(self, file_path):
        self.df = pd.read_excel(file_path)

    def get_urls_with_form(self):
        urls = []
        if "Has a Form?*" not in self.df.columns or "URL" not in self.df.columns:
            raise ValueError("Expected columns: 'Has a Form?*' and 'URL'")
        for index, row in self.df.iterrows():
            if str(row["Has a Form?*"]).strip().lower() == "yes":
                urls.append(row["URL"])
        return urls
