class LikePost
  attr_accessor :post, :user

  def initialize(post, user)
    self.post = post
    self.user = user
  end

  def call
    if Vote.exists?(user: user, post: post)
      Response::Error.new(message: 'Vote already exists')
    elsif post.author == user
      Response::Error.new(message: 'Author cannot vote')
    else
      vote = Vote.new(user: user, post: post)
      if vote.save
        Response::Success.new(message: 'Vote created')
      else
        Response::ActiveModelError(vote)
      end
    end
  end
end
