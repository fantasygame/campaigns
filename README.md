# Campaigns
![alt tag](http://oi58.tinypic.com/2nv8n61.jpg)

[![](http://img.shields.io/travis/fantasygame/campaigns.svg?style=flat-square)](https://travis-ci.org/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/coverage/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)

### Heroku

Check out our app [here](http://rpgcampaigns.herokuapp.com/)

## General info

The purpose of this app is to manage RPG campaigns.

User can create campaign and games in it. Every user assigned to game will be and asked to contribute. This way we can create nice little campaign weblog.

## Features

### First release
* [DONE] Register to Campaigns with confirmation email
* [DONE] Create campaign with name and description
* [DONE] Join campaign
* [DONE] List all campaigns
* [DONE] Edit campaign
* [DONE] Delete campaign (delete corresponding games, paranoid)
* [DONE] Unsubscribe from campaign
* [DONE] Create games inside campaign (name)
* [DONE] Show campaign with listed games
* [DONE] Notify users about new game created (email)
* [DONE] Create posts in games (text)
* [DONE] Show game with listed posts
* [DONE] Edit game
* [DONE] Edit post
* [DONE] Delete post (paranoid)
* [DONE] Delete game (delete corresponding posts, paranoid)
* [DONE] Show campaign with listed posts

### Future releases
* Add notifications in fantasygame.pl shoutbox
* Invite people to register
* Invite users to campaign (send email)
* List all invitations
* Show invitation
* Accept invitation
* Cancel invitation
* Add images to post
* Add images to campaign
* Thumbs up to posts
* Super thumbs up to posts
* User points
* User points in campaign
* Point for creating game
* Spending points on rewards
* Managing inventory, selling
* User profile
* User avatar

## Technologies

* Ruby on Rails 4.1.8
* Ruby 2.1.5
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