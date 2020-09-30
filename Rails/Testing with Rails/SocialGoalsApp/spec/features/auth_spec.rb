require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit "/users/new"
    expect(page).to have_button "Sign up"
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup'
      visit "/users/new"
      email = Faker::Internet.email
      fill_in "Email", with: email
      fill_in "Password", with: Faker::Internet.password(min_length: 6)
      click_button "Sign up"
      expect(page).to have_content(email)
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
      visit "/session/new"
      fill_in "Email", with: "test@testing.com"
      fill_in "Password", with: "testing"
      click_button "Login"
      expect(page).to have_content "test@testing.com"
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit "/"
    expect(page).to have_content "Login"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
      visit "/session/new"
      fill_in "Email", with: 'test@testing.com'
      fill_in "Password", with: "testing"
      click_button "Login"
      click_link "Logout"
      expect(page).not_to have_content "test@testing.com"
  end
end