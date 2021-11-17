from PySide6.QtWidgets import QMainWindow, QApplication
from ui import UI_MainWindow

import sys

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.ui = UI_MainWindow()
        self.ui.setupUi(self)
    
    if __name__ == "__main__":
        app = QApplication()
        
        window = MainWindow()
        window.show()
        
        sys.exit(app.exec())