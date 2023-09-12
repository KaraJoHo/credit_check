class CreditCard < ApplicationRecord 
  validates_presence_of :number, :limit

  before_create :check_number

  def check_number 
    num_array = self.number.digits.reverse

    double_nums = num_array.map.with_index do |num, i| 
      if i.odd?
        num 
      else
        double = num * 2 

        double.digits.count >= 2 ? double.digits.sum : double
      end
    end
    self.valid_number = double_nums.sum % 10 == 0 
  end

  def self.valid_cards 
    where(valid_number: true)
  end

  def last_four_digits 
    number.to_s[-4..-1]
  end
end