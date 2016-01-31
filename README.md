[![Build Status](https://api.travis-ci.org/denispeplin/task_manager.png?branch=master)](http://travis-ci.org/denispeplin/task_manager)

**Demo app**: [https://task-manager-vm.herokuapp.com](https://task-manager-vm.herokuapp.com)

## Install

```
bundle install
rake db:create
rake db:migrate
rake db:seed
```

## Run

```
rails s
```

## Test

```
rspec
```

## Heroku

Note: db:seed is for demo mode only, don't do it in a real production.

```
git push heroku master
heroku run rake db:migrate db:seed
heroku ps:scale web=1
heroku ps
heroku open
```

Also, for a real production, follow
[Heroku recommendations on Puma setup](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server).
