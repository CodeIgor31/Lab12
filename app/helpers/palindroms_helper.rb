module PalindromsHelper
    def self.result_array(num)
        arr = (0..num).select do |elem|
          elem.to_s == elem.to_s.reverse && (elem**2).to_s == (elem**2).to_s.reverse
        end
        Array(arr)
      end
end
