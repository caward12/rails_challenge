require 'rails_helper'

describe "registered user" do
  it "can login with valid credentials" do
    User.create(name: "Bob", email: "bob@bob.com", password: "1234")

    visit root_path
    click_on "Login"
    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: "bob@bob.com"
    fill_in "session[password]", with: "1234"
    click_on "Login to Account"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome bob@bob.com")
  end

  it "cannot login with invalid credentials" do
    User.create(name: "Bob", email: "bob@bob.com", password: "1234")

    visit login_path
    fill_in "session[email]", with: "bob@bo.com"
    fill_in "session[password]", with: "1234"
    click_on "Login to Account"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Credentials did not match")
  end
end