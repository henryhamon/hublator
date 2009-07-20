Factory.define :city do |c|
  c.name 'Gothan'
  c.association :state
end

Factory.define :state do |s|
  s.name 'Santa Catarina'
  s.abreviation 'SC'
end

Factory.define :address do |a|
  a.street 'Rua dos bobos'
  a.number 0
  a.district 'District'
  a.association :user
  a.association :city
end

