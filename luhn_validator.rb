# frozen_string_literal: true

# For LuhnValidator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # check = nums_a.pop
    nums_a = nums_a.reverse.each_with_index.map do |num, i|
      if i.odd?
        (num * 2).digits.sum
      else
        num
      end
    end
    # sum = (10 - (nums_a.reduce(:+) % 10)) % 10
    # sum == check
    sum = nums_a.reduce(:+)
    (sum % 10).zero?
  end
end
