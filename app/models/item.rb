class Item < ApplicationRecord
  belongs_to :campaign
  belongs_to :hero
end
