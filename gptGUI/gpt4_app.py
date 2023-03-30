import sys
import openai
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QPushButton, QTextEdit, QLabel

class GPT4App(QWidget):
    def __init__(self):
        super().__init__()

        # Set up the user interface
        self.initUI()

    def initUI(self):
        layout = QVBoxLayout()

        self.input_text = QTextEdit()
        layout.addWidget(QLabel('Enter your prompt:'))
        layout.addWidget(self.input_text)

        generate_button = QPushButton('Generate')
        generate_button.clicked.connect(self.generate_text)
        layout.addWidget(generate_button)

        self.output_text = QTextEdit()
        layout.addWidget(QLabel('Generated text:'))
        layout.addWidget(self.output_text)

        self.setLayout(layout)
        self.setWindowTitle('GPT-4 API App')
        self.show()

    def generate_text(self):
        # Add your OpenAI API key here
        openai.api_key = "your-api-key"

        prompt = self.input_text.toPlainText()

        response = openai.Completion.create(
            engine="text-davinci-002",
            prompt=prompt,
            max_tokens=150,
            n=1,
            stop=None,
            temperature=0.7,
        )

        generated_text = response.choices[0].text
        self.output_text.setPlainText(generated_text)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = GPT4App()
    sys.exit(app.exec_())
