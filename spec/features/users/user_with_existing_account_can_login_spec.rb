require 'rails_helper'

describe "User can login to existing account" do
  scenario "user logs into account" do
    user = create(:user)

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Account Profile")
    expect(page).to have_content("Name: #{user.name}")
    expect(page).to have_content("Email: #{user.email}")
  end

  scenario "user puts in an email that is not found" do
    create_list(:user, 100)
    user_1 = User.first

    visit login_path

    fill_in "email", with: "not an email"
    fill_in "password", with: user_1.password
    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Email not found")
  end

  scenario "user inputs wrong password" do
    user = create(:user)

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: "wrong" + user.password
    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Incorrect password")
  end
end
