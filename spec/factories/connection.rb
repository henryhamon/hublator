Factory.define :connection do |c|
  c.association :user
  c.association :contact, :factory => :user
end
