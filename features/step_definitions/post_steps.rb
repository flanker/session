# require 'hashie'

When /^I go to home page$/ do
  visit '/'
end

When /^I click 'New post'$/ do
  click_link 'New Post'
end

When /^I fill in the following:$/ do |table|
  table.rows_hash.each do |key, value|
    fill_in key, :with => value
  end
end

When /^I save the post$/ do
  click_button 'Create Post'
end

Then /^I should redirect to post index page/ do
end

Then /^there should have the following post in the home page:$/ do |table|
  table.rows_hash.each do |key, value|
    page.should have_content(value)
  end
end
