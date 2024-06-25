# Flask i18n (internationalization)

This project demonstrates how to implement internationalization (i18n) in a Flask web application using Flask-Babel.


## Resources

- [Flask i18n tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xiii-i18n-and-l10n)
- [pytz](https://sourceforge.net/directory/software-development/linux/)

## Learning Objectives

1. Learn how to parametrize Flask templates to display different languages
2. Learn how to infer the correct locale based on URL parameters, user settings or request headers
3. Learn how to localize timestamps

## Usage

Once the ALU Web Back-End is up and running, you can perform various tasks, including:

- Authenticating users
- Managing user accounts
- Handling API requests from the front-end

For detailed information on how to use the different features, please refer to the documentation.

## Contributing

We welcome contributions from the community! If you would like to contribute to the ALU Web Back-End, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your changes to your forked repository.
5. Submit a pull request to the main repository.
## Project Structure

```plaintext
.
├── babel.cfg
├── messages.pot
├── translations
│   ├── en
│   │   └── LC_MESSAGES
│   │       ├── messages.mo
│   │       └── messages.po
│   ├── fr
│   │   └── LC_MESSAGES
│   │       ├── messages.mo
│   │       └── messages.po
├── templates
│   └── 3-index.html
└── 3-app.py
