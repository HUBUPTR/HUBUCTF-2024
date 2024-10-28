import flask
import os
from flask import send_from_directory, abort

app = flask.Flask(__name__)


@app.route("/")
def index():
    return "Enjoy your CTF challenges!"


@app.route("/robots.txt")
def robots():
    return "User-agent: *\nDisallow: /.git"


@app.route("/.git/<path:filename>")
def git_directory(filename):
    git_dir = os.path.join(os.getcwd(), ".git")
    if os.path.isfile(os.path.join(git_dir, filename)):
        return send_from_directory(git_dir, filename)
    else:
        abort(404)  # File not found


if __name__ == "__main__":
    app.run(host="0.0.0.0")
