Factory.define :project do |p|
  p.name 'Lord of the rings'
  p.category 'book'
  p.url 'http://www.xkcd.com'
  p.description 'one ring to rule them all'
  p.association :user
  p.status 'processed'
end
