require 'spec_helper'
require 'rails_helper'

feature "creating goals" do
  before(:each) do
      user = User.new({email: "test@testing.com", password: "testing"})
      user.save!
      visit "/session/new"
      fill_in "Email", with: 'test@testing.com'
      fill_in "Password", with: "testing"
      click_button "Login"
  end

  scenario "has a goal page on the public goals listings" do
    visit "/goals"
    expect(page).to have_content "Public goals"
    expect(page).to have_link "New goal"
  end

  scenario "goes to goal page after creation" do
    visit "/goals/new"
    fill_in "Title", with: "My New Goal"
    fill_in "goal_description", with: "My goal's description"
    click_button "Add Goal"
    expect(page).to have_content "My New Goal"
  end
end

feature "viewing goals" do
  before(:each) do
    @user = User.new({email: "test@testing.com", password: "testing"})
    @user.save!
    visit "/session/new"
    fill_in "Email", with: 'test@testing.com'
    fill_in "Password", with: "testing"
    click_button "Login"
    @goal = Goal.new({user_id: @user.id, title: "New goal", description: "My goal's description"})
    @goal.save!
  end
  scenario "goal should show description and name" do
    visit "/goals/" + @goal.id.to_s
    expect(page).to have_content "New goal"
    expect(page).to have_content "My goal's description"
  end
  scenario "goal should have option for editing" do
    visit "/goals/" + @goal.id.to_s
    expect(page).to have_link "Edit goal"
  end
  scenario "goal should have an option for deleting" do
    visit "/goals/" + @goal.id.to_s
    expect(page).to have_button "Delete goal"
  end
end

feature "editing goals" do
  before(:each) do
    @user = User.new({email: "test@testing.com", password: "testing"})
    @user.save!
    visit "/session/new"
    fill_in "Email", with: 'test@testing.com'
    fill_in "Password", with: "testing"
    click_button "Login"
    @goal = Goal.new({user_id: @user.id, title: "Old goal title", description: "My goal's description"})
    @goal.save
  end
  scenario "should be able to update goal title" do
    visit "/goals/" + @goal.id.to_s
    old_title = @goal.title
    click_link "Edit goal"
    fill_in "goal_title", with: "A new goal title"
    click_button "Update Goal"
    expect(page).not_to have_content old_title
  end
end