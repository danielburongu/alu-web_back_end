#!/usr/bin/env python3
"""
Flask App with Flask-Babel configuration.

This module sets up a Flask application with Flask-Babel configured for i18n support.
"""

from typing import List
from flask import Flask, render_template
from flask_babel import Babel

app = Flask(__name__)

class Config:
    """
    Config class for configuring Flask-Babel.

    Attributes:
        LANGUAGES (list): List of supported languages.
        BABEL_DEFAULT_LOCALE (str): Default locale/language.
        BABEL_DEFAULT_TIMEZONE (str): Default timezone.
    """
    LANGUAGES: List[str] = ['en', 'fr']
    BABEL_DEFAULT_LOCALE: str = 'en'
    BABEL_DEFAULT_TIMEZONE: str = 'UTC'

app.config.from_object(Config)

babel = Babel(app)

@app.route('/')
def index() -> str:
    """
    Route to render the index HTML template.

    Returns:
        str: Rendered HTML content.
    """
    return render_template('1-index.html')

if __name__ == '__main__':
    app.run()
