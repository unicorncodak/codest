# TaskApp

This application will let you manage your daily tasks. You can create new tasks and search for existing tasks using filtering.
TaskApp works with multiple users. Each user has its own tasks.

## Development setup

Install required tools:
* ruby (use `rbenv` or `rvm`). Proper version is defined in `.ruby-version` file.
* nodejs (use `nvm`). See `.nvmrc` file for specific version.
* `yarn`: `npm install -g yarn`

Run following commands:
* `bundler install` to install all required gems.
* `yarn install` to install all required javascript packages.
* `rails db:create db:migrate` to create database and run all migrations
* `rails db:seed` to seed database

## Development

Run command `rails server` and you are ready to go.
Visit website [http://localhost:3000](http://localhost:3000) and sign in as `test@test.pl` user with `qwe123` password.
