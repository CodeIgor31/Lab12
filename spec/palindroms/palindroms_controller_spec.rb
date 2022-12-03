# frozen_string_literal: true

require 'spec_helper'
require'rails_helper'

# testing PalindromsController
RSpec.describe PalindromsHelper do
  context 'res_array function check' do
    it 'returns correct array' do
      expect(PalindromsHelper.result_array(11)).to eq([0, 1, 2, 3, 11])
      expect(PalindromsHelper.result_array(0)).to eq([0])
      expect(PalindromsHelper.result_array(-1)).to eq([])
    end
  end
end

RSpec.describe PalindromsController, type: :request do
  context 'notice message test' do
    it 'return notice message' do
      get '/palindroms/index'
      expect(flash[:warning]).to eq('Вы не авторизованы')
    end
  end
end

