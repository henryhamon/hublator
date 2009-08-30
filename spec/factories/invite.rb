Factory.define :invite do |a|
  a.association :projects
  a.association :language
  a.association :user
  a.read false
end


