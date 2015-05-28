# Campaigns
![alt tag](http://oi58.tinypic.com/2nv8n61.jpg)

[![](http://img.shields.io/travis/fantasygame/campaigns.svg?style=flat-square)](https://travis-ci.org/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/coverage/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)

### Heroku

Check out our app [here](http://rpgcampaigns.herokuapp.com/)

## General info

The purpose of this app is to manage RPG campaigns.

Simple app to keep track of pen’n’paper RPG campaigns.
User can create campaign and games in it. Every user assigned to campaign is notified about new game by email and asked to contribute. He can leave his summary/review of the game or funny quotes. This way we can create nice little campaign weblog. Users can ‘love’ others posts giving them points. For that points they can buy rewards that can help them during game. This is a great motivation to contribute.

Players can also keep track of their characters in games and their equipment.

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

> Create postgresql superuser campaigns

> cp config/database.example.yml config/database.yml

> cp config/application.example.yml config/application.yml

> rake db:setup

## Tests

We use RSpec 3 for backend testing.

## Notes

Please follow Ruby style guide available [here](https://github.com/bbatsov/ruby-style-guide).

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please contact
me and I’ll add a note to the README so that others can find your work.

## License

MIT (in LICENCE file)

## Authors

* Jakub Kubacki
* Małgorzata Grobelska
* Dawid Roszkiewicz
