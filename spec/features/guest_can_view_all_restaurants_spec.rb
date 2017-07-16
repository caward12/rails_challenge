require 'rails_helper'

describe "guest user" do
  it "can view all restaurants" do
    user =     User.create(name: "Bob", email: "bob@bob.com", password: "1234")
    user.restaurants.create(name: "Lucky Pie", cuisine: "Pizza" , city: "Denver", state: "CO", zip: "80203")
    visit root_path

    expect(page).to have_content("Lucky Pie")
    expect(page).to have_content("Pizza")
    expect(page).to have_content("Denver CO 80203")

  end
end