#!/usr/bin/env python3
"""
Route module for the API
"""
from os import getenv
from flask import Flask, render_template, request, g
from flask_babel import Babel

app = Flask(__name__)


class Config:
    """Configuration class"""
    LANGUAGES = ['en', 'fr']
    BABEL_DEFAULT_LOCALE = 'en'
    BABEL_DEFAULT_TIMEZONE = 'UTC'


app.config.from_object(Config)
babel = Babel(app)

users = {
    1: {"name": "Balou", "locale": "fr", "timezone": "Europe/Paris"},
    2: {"name": "Beyonce", "locale": "en", "timezone": "US/Central"},
    3: {"name": "Spock", "locale": "kg", "timezone": "Vulcan"},
    4: {"name": "Teletubby", "locale": None, "timezone": "Europe/London"},
}


@babel.localeselector
def get_locale():
    """Select the best match locale from request"""
    local_lang = request.args.get('locale')
    if local_lang in app.config['LANGUAGES']:
        return local_lang
    user = g.get('user')
    if user and user['locale'] in app.config['LANGUAGES']:
        return user['locale']
    return request.accept_languages.best_match(app.config['LANGUAGES'])


def get_user():
    """Get user by ID"""
    try:
        user_id = request.args.get('login_as')
        if user_id:
            return users.get(int(user_id))
    except Exception:
        pass
    return None


@app.before_request
def before_request():
    """Run before each request"""
    g.user = get_user()


@app.route('/')
def index():
    """Render the home page"""
    return render_template("5-index.html")


if __name__ == "__main__":
    host = getenv("API_HOST", "0.0.0.0")
    port = getenv("API_PORT", "5000")
    app.run(host=host, port=port)
