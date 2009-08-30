Factory.define :page do |p|
  p.association :project
  p.association :language
  p.page_number 1
  p.content 'content goes here'
  p.finished false
  p.status 'released'
end
