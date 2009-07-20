require File.join(File.dirname(__FILE__), 'sequences.rb')

Factory.define :user do |u|
  u.name 'João Frango'
  u.birthdate( Date.today - 18.years)
  u.email Factory.next :email
  u.login Factory.next :login
  u.password 'secret'
  u.password_confirmation { |u| u.password }
end


