Factory.define :speech do |s|
  s.association :user
  s.association :language
  s.level 'fluent'
end
