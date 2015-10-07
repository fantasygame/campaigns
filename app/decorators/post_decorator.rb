class PostDecorator < Draper::Decorator
  delegate_all

  def escaped_content
    content.gsub(/(?:\n\r?|\r\n?)/, '<br />').html_safe
  end
end
