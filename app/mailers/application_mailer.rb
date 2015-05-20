class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_PROVIDER_USERNAME']
end
