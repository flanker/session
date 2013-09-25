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

Then /^I should be redirected to home page/ do
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

Given(/^I have post$/) do
  @post = Post.create(title: 'La La la', content: 'bla bla')
end

When(/^I go to the post detail page$/) do
  visit "/posts/#{@post.id}"
end

When(/^I click 'Delete'$/) do
  click_button 'Delete'
end

Then(/^I should not see that post$/) do
  page.should_not have_content('La La la')
end
