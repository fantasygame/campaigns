# Campaigns
[![](http://img.shields.io/travis/fantasygame/campaigns.svg?style=flat-square)](https://travis-ci.org/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)
[![](http://img.shields.io/codeclimate/coverage/github/fantasygame/campaigns.svg?style=flat-square)](https://codeclimate.com/github/fantasygame/campaigns)

## General info

The purpose of this app is to manage RPG campaigns.

User can create campaign and sessions in it. Every user assigned to session will be and asked to contribute. This way we can create nice little campaign weblog.

## Features

### First release
* [DONE] Register to Campaigns
* Create campaign with name and description
* Join campaign
* Create sessions inside campaign (name, users)
* Notify users about new session created (email)
* Create posts in sessions (text)
* List all campaigns
* Show campaign with listed sessions
* Show campaign with listed posts
* Show session with listed posts
* Edit campaign
* Edit session
* Edit post
* Delete post (paranoid)
* Delete session (delete corresponding posts, paranoid)
* Delete campaign (delete corresponding sessions, paranoid)

### Future releases
* Add notifications in fantasygame.pl shoutbox
* Invite people to register
* Invite users to campaign (send email)
* List all invitations
* Show invitation
* Accept invitation
* Cancel invitation
* Unsubscribe from campaign
* Add images to post
* Add images to campaign
* Thumbs up to posts
* Super thumbs up to posts
* User points
* User points in campaign
* Point for creating session
* Spending points on rewards
* Managing inventory, selling

### Heroku

App is available on [heroku](http://rpgcampaigns.herokuapp.com/)

## Technologies

* Ruby on Rails 4.1.8
* Ruby 2.1.5
* Postgresql
* HAML
* Bootstrap 3

## Setup

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

http://opensource.org/licenses/MIT

## Authors

* Jakub Kubacki
* Małgorzata Grobelska