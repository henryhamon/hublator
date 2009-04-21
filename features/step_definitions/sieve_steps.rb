Given /^I have sieves titled (.+)$/ do |names|
  names.split(', ').each do |name|
    Sieve.create!(:name => name)
  end
end

Given /^I have no sieve$/ do
  Sieve.delete_all
end

Then /^I should have ([0-9]+) sieve$/ do |count|
  Sieve.count.should == count.to_i
end

