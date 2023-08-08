require "rails_helper"

RSpec.describe CreditCard do 
  before(:each) do 
    @cc = CreditCard.create!(number: 5541808923795240, limit: 15000)
    @cc_bad_num = CreditCard.create!(number: 6011797668868728, limit: 15000)
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
end