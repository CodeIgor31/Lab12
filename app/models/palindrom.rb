# frozen_string_literal: true

# good
class Palindrom
    include ActiveModel::Model
    include ActiveModel::Validations
    include PalindromsHelper
    
    attr_accessor :num
  
    validates :num, presence: { message: 'не может быть пустым' }
    validates_numericality_of :num, only_integer: true, greater_than_or_equal_to: 0
    
    def print_res
        number = num.to_i
        return if number.negative?

        @hash = result_hash(number)
      end
  end