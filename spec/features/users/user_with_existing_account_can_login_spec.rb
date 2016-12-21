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
end
