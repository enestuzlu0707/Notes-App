# Notes App

![CircleCI](https://img.shields.io/circleci/build/github/luisbilecki/notes-app)

Notes App using Ruby on Rails, Postgres, and React.

https://whispering-lowlands-12048.herokuapp.com/

---

## Requirements

- Ruby 2.3.8
- Rails 5.1.5
- Postgres >= 10

I'm using [RVM](https://rvm.io/) to handle with Ruby enviroments. For this repository, the environment is configured in `.rvmrc` file.

---

## How to run?

1. Create .env file with the content below:

```bash
  POSTGRES_USER='<POSTGRES_USER_HERE>'
  POSTGRES_PASSWORD='<POSTGRES_USER_PASSWORD_HERE>'
  POSTGRES_HOST='<POSTGRES_HOST_HERE>'
```

2. Install required gems for project:

```bash
  bundle install
```

3. Setup database:

```bash
  rails db:setup
```

4. Run app using Passenger:

```bash
  bundle exec passenger start
```

5. Open your web browser and go to `http://localhost:3000`.

---

## How to test?

1. Run RSpec using:

```bash
  bundle exec rspec
```

---

## Further steps:

- This app uses the gem [react-rails](https://github.com/reactjs/react-rails) to integrate React.js in Rails views. To integrate React.js, only the initial configuration of the gem was performed following the steps in the documentation. Therefore, for production, it is necessary to review the auto-generated files;
- Write feature tests using Capybara (https://thoughtbot.com/blog/rspec-integration-tests-with-capybara).

### Contribute:

Please feel free to contribute, forking this repository, and sending your pull request
