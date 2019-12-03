require 'capybara'
require 'capybara/rspec'
require 'rack/test'

feature "url shortener" do
	scenario "a user visits the homepage" do
		visit '/'
		expect(page).to have_content("Enter the url you'd like to shorten:")
	end
	
	scenario "url shortening request is submitted" do
		visit '/'
		fill_in('url', with: "bloomberg.com")
		click_button('submit')
		expect(page).to have_link("http://bloomberg.com")
	end
end