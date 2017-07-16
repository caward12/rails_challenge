require 'rails_helper'

describe "new user registration" do
  it "new user visit registration form" do
    visit root_path

    click_on "Register"

    expect(current_path).to eq(new_user_path)
  end

  it "new user can create account" do
    visit new_user_path

    fill_in "user[name]", with: "Bob"
    fill_in "user[email]", with: "bob@bob.com"
    fill_in "user[password]", with: "1234"
    click_on "Create New Account"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome bob@bob.com")
    expect(page).to have_content("All Restaurants")
    expect(page).to_not have_content("Register")
  end

  it "new user cannot register with same email twice" do
    User.create(name: "Bob", email: "bob@bob.com", password: "1234")
    visit new_user_path
    fill_in "user[name]", with: "Sue"
    fill_in "user[email]", with: "bob@bob.com"
    fill_in "user[password]", with: "456"
    click_on "Create New Account"
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Sorry, that email has already been taken")
  end
end