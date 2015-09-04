module MessagesHelper
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' data-img-src='#{user.avatar}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
    end
    s.html_safe
  end
end