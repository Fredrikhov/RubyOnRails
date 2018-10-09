# RubyOnRails
Website using Ruby On Rails

Dependencies:

PostgreSQL
ruby 2.5.1

- Setup database (SQLite for development / PostgreSQL for production)
- bundle install
- Migrate db (bin/rails db:migrate)
- Run

Functions:
- Authentication email/password (with email-verification)
- Articles (only members can make articles, non-members can read them)
- Search function (search through articles)
- Bootstrap (SASS) design.

NB:
Email verification will not work if your do not pass in your email information.

Remember to pass your email/password in config/environments/development.rb and production.rb).



