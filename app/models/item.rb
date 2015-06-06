class Item < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :hero
end
