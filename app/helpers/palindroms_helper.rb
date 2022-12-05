# frozen_string_literal: true

# palindtoms helper
module PalindromsHelper
  def result_hash(num)
    arr = (0..num).select do |elem|
      elem.to_s == elem.to_s.reverse && (elem**2).to_s == (elem**2).to_s.reverse
    end
    Hash[arr.zip arr.map { |el| el**2 }]
  end
end
