require "rails_helper"

RSpec.describe "Index Welcome Page" do 
  it "is the root path/ welcome page" do 
    visit root_path 
    expect(page).to have_content("Credit Check")
  end
end