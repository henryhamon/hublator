Factory.define :activity do |a|
  a.association :streamable, :factory => :user
  a.action 'what the user did'
end


