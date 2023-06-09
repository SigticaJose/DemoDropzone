from flask import Flask, render_template, flash, redirect, url_for, session, logging, request, jsonify, make_response, send_file, send_from_directory, after_this_request, abort, Response
import os
app = Flask(__name__)

@app.route('/', methods=['GET','POST'])
def default():
    p = {
        'myvar1': 'foo',
        'myvar2': 'fee'
    }
    return render_template('test.html', p=p)

if __name__ == "__main__":
    app.run(debug=True, host='localhost', port=int(os.environ.get('PORT', 9080)))
