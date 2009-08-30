Factory.define :user do |u|
  u.name 'C3PO'
  u.country 'Brazil'
  u.login {Factory.next :login}
  u.email{Factory.next(:email)}
  u.password 'secret'
  u.password_confirmation 'secret'
end

Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :login do |n|
  "login#{n}"
end
