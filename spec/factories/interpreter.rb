Factory.define :interpreter do |s|
  s.association :user
  s.association :page
  s.kind 'translator'
end
