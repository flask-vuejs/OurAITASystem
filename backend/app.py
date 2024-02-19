from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():  # put application's code here
    return 'Hello World!'

@app.route('/home')
def home():
    return ""

if __name__ == '__main__':
    app.debug = True
    app.run()
