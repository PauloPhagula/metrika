# README

## System requirements

- Ruby v3.1
- MySQL v5.7
- Git
  
## Local Setup

- clone the repo `git clone git@github.com:PauloPhagula/metrika.git`
- `cd` into project folder, and
- Run `bundle install`
- Create a mysql db metrika_development: `CREATE DATABASE metrika_development`
- Edit `config/database.yml` and set db details
- Run `rails db:migrate`
- Run `rails db:seed`
- Run `rails server`
