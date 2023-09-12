require "rails_helper"

RSpec.describe CreditCard do 
  before(:each) do 
    @cc = CreditCard.create!(number: 5541808923795240, limit: 15000)
    @cc_2 = CreditCard.create!(number: 4024007136512380, limit: 15000)
    @cc_3 = CreditCard.create!(number: 6011797668867828, limit: 15000)
    @cc_bad_num = CreditCard.create!(number: 6011797668868728, limit: 15000)
    @cc_bad_num_2 = CreditCard.create!(number: 4024007106512380, limit: 15000)
  end

  describe "attributes" do 
    it "has a number and a validation" do 
      expect(@cc.number).to eq(5541808923795240)
      expect(@cc.limit).to eq(15000)
      expect(@cc.valid_number).to eq(true)
    end
  end

  describe "validations" do 
    it {should validate_presence_of :number} 
    it {should validate_presence_of :limit} 
  end

  describe "before create" do 
    it "validates the number" do 
      expect(@cc.check_number).to eq(true)
      expect(@cc_bad_num.check_number).to eq(false)
      expect(@cc.valid_number).to eq(true)
      expect(@cc_bad_num.valid_number).to eq(false)
    end
  end

  describe "valid_cards" do 
    it "is a collection of valid cards" do 
      expect(CreditCard.valid_cards).to eq([@cc, @cc_2, @cc_3])
    end
  end

  describe "last_four_digits" do 
    it "is the last 4 digits of the credit card" do 
      expect(@cc.last_four_digits).to eq("5240")
    end
  end
end