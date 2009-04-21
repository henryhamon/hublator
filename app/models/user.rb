class User < ActiveRecord::Base
  def self.authenticate(username, password)
    return false if username.blank? || password.blank?
    username.gsub!(/@gmail.com/,"")
    Google::Base.establish_connection(username, password)
    User.find_or_create_by_username(username)
  rescue Google::LoginError
    false
  end

end

