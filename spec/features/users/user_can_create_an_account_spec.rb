require 'rails_helper'

describe "User can create an account" do
  scenario "successfully creates an account" do
    name = "John Smith"
    email = "test@test.com"
    password = "123"

    visit new_user_path

    fill_in "user[name]", with: name
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    click_button "Create User"

    user = User.last
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Account created!")
    expect(page).to have_content("Name: #{user.name}")
    expect(page).to have_content("Email: #{user.email}")
  end

  # scenario
end
