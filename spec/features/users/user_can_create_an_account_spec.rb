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

  scenario "tries to create an account without name" do
    user_1 = create(:user)

    visit new_user_path

    fill_in "user[email]", with: user_1.email
    fill_in "user[password]", with: user_1.password
    click_button "Create User"

    expect(page).to have_content("Create account failed")
  end

  scenario "tries to create an account without email" do
    user_1 = create(:user)

    visit new_user_path

    fill_in "user[name]", with: user_1.name
    fill_in "user[password]", with: user_1.password
    click_button "Create User"

    expect(page).to have_content("Create account failed")
  end

  scenario "tries to create an account without password" do
    user_1 = create(:user)

    visit new_user_path

    fill_in "user[name]", with: user_1.name
    fill_in "user[email]", with: user_1.email
    click_button "Create User"

    expect(page).to have_content("Create account failed")
  end

  scenario "tries to create an account with non-unique email" do
    pending
    user_1 = create(:user)
    user_2 = create(:user, email: user_1.email)

    visit new_user_path

    fill_in "user[name]", with: user_2.name
    fill_in "user[email]", with: user_2.email
    fill_in "user[password]", with: user_2.password
    click_button "Create User"

    expect(page).to have_content("Create account failed")
  end
end
