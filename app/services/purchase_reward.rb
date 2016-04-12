class PurchaseReward
  attr_accessor :reward, :user

  def initialize(reward, user)
    self.reward = reward
    self.user = user
  end

  def call
    if reward.campaign.available_points(user) < reward.cost
      return Response::Error.new(message: "User have not enough points to buy this reward.")
    end
    purchase = Purchase.new(
      reward: reward, user: user, name: reward.name, cost: reward.cost, campaign: reward.campaign
    )
    if purchase.save
      Response::Success.new(message: "Reward Purchased")
    else
      Response::ActiveModelError.new(purchase)
    end
  end
end
