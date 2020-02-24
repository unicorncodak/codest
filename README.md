# TaskApp

This application will let you manage your daily tasks. You can create new tasks and search for existing tasks using filtering.
TaskApp works with multiple users. Each user has their own tasks.

## Setup

Install required tools:
* ruby (use `rbenv` or `rvm`). Proper version is defined in `.ruby-version` file.

Run following commands:
* `bundler install` to install all required gems
* `rails db:create db:migrate` to create database and run all migrations
* `rails db:seed` to seed database with default data

## Development

Run command `rails server` and you are ready to go.
Visit website [http://localhost:3000](http://localhost:3000) and sign in as `test@test.pl` user with `qwe123` password.

## Your tasks

1. Add possibility to sort tasks. Clicking on "Title" and "Priority" labels should sort tasks by corresponding attribute. Second click should reverse order.
2. `TasksController#index` method is a little bit messy. Refactor it to make it more readable. Beside readability do you see any other problems with its code? Could you fix them too?
3. Some user reported that there is a security vulnerability in the app. Somehow an user can create a task as another user and we have no idea how is it possible because we already call `before_action :authenticate_user!` in `TasksController`. Can you find the problem and fix it?
4. Code is untested. Add RSpec to the project and write specs which covers changes you have made in previous tasks.

After you finish send us entire code in zip/gzip file.
