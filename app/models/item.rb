class Item < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :hero

  belongs_to :last_owner, class_name: 'User'
end
