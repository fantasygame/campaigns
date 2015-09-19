namespace :comments do
  desc "Move posts to polymophic subject"
  task copy_posts_to_subject: :environment do
    Comment.all.each do |comment|
      next unless comment.post.present?
      comment.subject = comment.post
      comment.save
    end
  end
end
