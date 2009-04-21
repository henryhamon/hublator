Given /^I have mines titled (.+)$/ do |names|
  names.split(', ').each do |name|
    Mine.create!(:name => name)
  end
end

Given /^I have no mines$/ do
  Mine.delete_all
end

Then /^I should have ([0-9]+) mine$/ do |count|
  Mine.count.should == count.to_i
end

