# Capybara API

# Navigation
  #vist
  #click_on
#Forms
  #fill_in "field", with: "value"
  #choose, check, uncheck
  #select "option", from: "select box"
#Assertions
  #have_content
  #current_path
  #page
#Debugging
  #save_and_open_page

#/spec/features/capy_features_spec.rb
require 'rails-helper'

feature "capybara features", type: :feature do
  feature "making a new capybara" do
    #before(:each) do
    #  visit "/capys/new"
    #end

    scenario "with invalid params" do
      create_capy("pam", "pink")
      #ill_in "name", with: "pam"
      #click_on "Create Capy"
      expect(current_path).to eq("/capys")
      expect(page).to have_content("Color can't be blank")
    end

    scenario "with valid params" do
      create_capy("pam", "pink")
      #save_and_open_page
      expect(page).to have_content("pam")
      expect(current_path).to eq("/capys/#{Capy.find_by({name: "pam"}).id}")
    end

  end
end

#in spec_helper.rb
def create_capy(name, color)
  visit "/capys/new"
  fill_in "name", with: name
  fill_in "color", with: color
  click_on "Create Capy"
end