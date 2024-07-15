from flask import Flask, render_template

app = Flask(__name__)

def log_ip(ip_address):
    log_entry = {'ip': ip_address}
    try:
        with open('ips.json', 'r') as file:
            data = json.load(file)
    except FileNotFoundError:
        data = []

    data.append(log_entry)

    with open('ips.json', 'w') as file:
        json.dump(data, file, indent=4)



@app.route('/')
def index():
    ip_address = request.remote_addr
    log_ip(ip_address)
    return render_template('index.html')

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

app.run(debug=True,host='0.0.0.0',port=80)




