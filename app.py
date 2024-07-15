from flask import Flask, render_template

app = Flask(__name__)

def log_ip(ip_address):
    with open('ips.txt', 'a') as file:
        file.write(f"{ip_address}\n")



@app.route('/')
def index():
    ip_address = request.remote_addr
    log_ip(ip_address)
    return render_template('index.html')

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

app.run(debug=True,host='0.0.0.0',port=80)




