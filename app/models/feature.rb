class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  strategy Flip::DatabaseStrategy
  strategy Flip::DeclarationStrategy
  default false

  feature :comments,
    default: false,
    description: 'Posting and showing comments'

  feature :heroes,
    default: false
end
