# Campaigns
![alt tag](http://i62.tinypic.com/eqe5bq.png)

[![](http://img.shields.io/travis/fantasygame/campaigns.svg?style=flat-square)](https://travis-ci.org/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/coverage/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)

## [Check out our app](http://rpgcampaigns.herokuapp.com/)

## General info

The purpose of this app is to manage RPG campaigns.

Simple app to keep track of pen’n’paper RPG campaigns.
User can create campaign and games in it. Every user assigned to campaign is notified about new game by email and asked to contribute. He can leave his summary/review of the game or funny quotes. This way we can create nice little campaign weblog. Users can ‘love’ others posts giving them points. For that points they can buy rewards that can help them during game. This is a great motivation to contribute.

Players can also keep track of their characters in games and their equipment.
They can also propose their ideas to game master and earn points that way.

## Technologies

* Ruby on Rails 4.2.0
* Ruby 2.2.0
* Postgresql
* HAML
* Bootstrap 3
* Devise authentication
* Pundit authorization
* Continous deployment with Travis and Heroku
* Code Climate quality check

## Setup
### Clone repository
`git clone git@github.com:fantasygame/campaigns.git`

### Download gems
`bundle install`

### Install database (postgresql)

Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04

OSX: http://postgresapp.com/

### Create postgresql superuser campaigns.

To do that you can use interactive psql command
`createuser --interactive`

### Copy config
`cp config/database.example.yml config/database.yml`

`cp config/application.example.yml config/application.yml`

### Setup database
`rake db:setup`

## Tests
We use RSpec 3 for backend testing.

## Development (fantasygame team)
* Make sure that you have your email and name set in git on your machine. It won't recognize your commits if you don't do this. https://help.github.com/articles/setting-your-email-in-git/
* Make sure to connect your machine to github by ssh https://help.github.com/articles/generating-ssh-keys/
* Don't fork the project. We use one-repo single-branch approach for rapid development.
* Every commit is reviewed by the other team member. Make sure to fix any issue that is found.
* We use rubocop to mantain high code quality. Make sure to follow its advices. Install rubocop plugin to your editor.
* Make your best to write tests for your code. You can check code coverage in codeclimate.
* We don't like merge commits. Use rebase. `bash git config --global branch.autosetuprebase always `

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.
* Please follow Ruby style guide available [here](https://github.com/bbatsov/ruby-style-guide) and rubocop.yml

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please contact
me and I’ll add a note to the README so that others can find your work.

## License

MIT (in LICENCE file)

## Authors

* Małgorzata Grobelska
* Jakub Kubacki
