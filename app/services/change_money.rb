class ChangeMoney
  attr_accessor :user, :subject, :change

  def initialize(user, subject, change)
    self.user = user
    self.subject = subject
    self.change = change
  end

  def call
    create_money_history if subject.is_a?(Campaign) && Flip.on?(:money_history)
    money_change
  end

  private

  def money_change
    subject.money = subject.money + change
    subject.save
  end

  def create_money_history
    MoneyHistory.create(
      money_before: subject.money,
      user: user,
      difference: change,
      campaign: subject
    )
  end
end
