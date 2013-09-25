# require 'hashie'

When /^I go to home page$/ do
  visit '/'
end

When /^I click 'New post'$/ do
  within ('.blog-header')do
    click_link 'New Post'
  end
end

When /^I fill in the following:$/ do |table|
  table.rows_hash.each do |key, value|
    fill_in key, :with => value
  end
end

When /^I save the post$/ do
  click_button 'Create Post'
end

Then /^I should be redirected to post index page/ do
  page.current_path.should == '/posts'
end

Then(/^I should see following post:$/) do |table|
  table.rows_hash.each do |key, value|
    page.should have_content(value)
  end
end

Then /^I should see the error message "([^"]*)"$/ do |error|
  page.should have_content(error)
end
