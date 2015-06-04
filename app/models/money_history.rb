class MoneyHistory < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
  has_many :users

  def money_after
    money_before + difference
  end
end
