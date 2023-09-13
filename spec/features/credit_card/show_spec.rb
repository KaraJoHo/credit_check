require "rails_helper"

RSpec.describe "Credit Card Show Page" do
   before(:each) do 
    @cc = CreditCard.create!(number: 5541808923795240, limit: 15000)
    @cc_2 = CreditCard.create!(number: 4024007136512380, limit: 15000)
    @cc_3 = CreditCard.create!(number: 6011797668867828, limit: 15000)
    @cc_bad_num = CreditCard.create!(number: 6011797668868728, limit: 15000)
    @cc_bad_num_2 = CreditCard.create!(number: 4024007106512380, limit: 15000)
   end

  describe "show_page" do 
    it "shows last 4 digits of the card" do 
      visit "/credit_cards/#{@cc.id}"

      expect(page).to have_content("5240")
      expect(page).to_not have_content("55418")
      expect(page).to_not have_content("2380")
    end

    it "shows if the card is valid" do 
      visit "/credit_cards/#{@cc.id}"

      expect(page).to have_content("Valid")
      expect(page).to_not have_content("Invalid")
    end

    it "shows invalid if the card number is invalid" do 
      visit "/credit_cards/#{@cc_bad_num.id}"

      expect(page).to have_content("Invalid")
      expect(page).to_not have_content("Valid")
    end
  end

  describe "sad_path" do 
    it "will not go to a random page for a card that doesnt exist" do 
      visit "/credit_cards/#{5555}"
      # save_and_open_page

      expect(request).to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end