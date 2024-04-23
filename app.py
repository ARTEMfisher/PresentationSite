from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('card.html',general='Comming Soon')

@app.route('/about')
def about():
    return render_template('index.html',general='About green baboon')

@app.route('/<int:id>')
def show(id):
    return render_template('id.html',id=id)

app.run(debug=True,host='0.0.0.0',port=80)




