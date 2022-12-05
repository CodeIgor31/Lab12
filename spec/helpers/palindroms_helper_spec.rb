# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing PalindromsHelper
RSpec.describe PalindromsHelper do
  context 'res_array function check' do
    it 'returns correct array' do
      expect(result_hash(11)).to eq({ 0 => 0, 1 => 1, 2 => 4, 3 => 9, 11 => 121 })
      expect(result_hash(0)).to eq({ 0 => 0 })
      expect(result_hash(-1)).to eq({})
    end
  end
end
