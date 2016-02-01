[![Build Status](https://api.travis-ci.org/denispeplin/task_manager.png?branch=master)](http://travis-ci.org/denispeplin/task_manager)

**Demo app**: [https://task-manager-vm.herokuapp.com](https://task-manager-vm.herokuapp.com)

## Warning

This application uses basic version of
[jQuery-File-Upload](https://github.com/blueimp/jQuery-File-Upload), which helps
to fight some Rails bugs (or features?), but also has some hard to fix bugs
(or features?). In particular, the task form is being sent immediately after
selecting or dragging in files (and un-setting autoUpload to false just breaks
uploading completely). It'll require more time to find a proper solution.

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
