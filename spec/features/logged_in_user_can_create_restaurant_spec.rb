require 'rails_helper'

describe "logged in user" do
  it "can go to form to create a Restaurant" do
    user = User.create(name: "Bob", email: "bob@bob.com", password: "1234")
    login_user(user)

    visit root_path
    click_on "Add a Restaurant"

    expect(current_path).to eq(new_restaurant_path)
  end

  it "can create a new restaurant" do
    user = User.create(name: "Bob", email: "bob@bob.com", password: "1234")
    login_user(user)

    visit new_restaurant_path

    fill_in "restaurant[name]", with: "Lucky Pie"
    fill_in "restaurant[cuisine]", with: "Pizza"
    fill_in "restaurant[city]", with: "Denver"
    fill_in "restaurant[state]", with: "CO"
    fill_in "restaurant[zip]", with: "80203"
    click_on "Add Restaurant"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Lucky Pie")
  end
end