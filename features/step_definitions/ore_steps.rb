Given /^I have no ore$/ do
  Ore.delete_all
end

Then /^I should have ([0-9]+) ore$/ do |count|
  Ore.count.should == count.to_i
end

