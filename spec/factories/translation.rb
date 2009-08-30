Factory.define :translation do |s|
  s.association :project
  s.association :language
  s.project_type 'fluent'
end
