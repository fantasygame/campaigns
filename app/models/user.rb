class User < ActiveRecord::Base
  has_many :games, through: :gameplays, class_name: 'Game'
  has_many :campaigns, through: :campaignplays, class_name: 'Campaign'
  has_many :posts
  has_many :votes, through: :posts
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def to_s
    name
  end

  def points
    PointsCalculator.new(self).call
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
end
