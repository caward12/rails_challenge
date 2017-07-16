require 'rails_helper'

describe "registered user" do
  it "can log out" do
    user = User.create(name: "Bob", email: "bob@bob.com", password: "1234")

    login_user(user)
    visit root_path

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Register")
    expect(page).to have_content("Login")
  end
end
