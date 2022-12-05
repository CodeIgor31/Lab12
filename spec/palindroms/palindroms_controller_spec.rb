# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing PalindromsController
RSpec.describe PalindromsController, type: :request do
  context 'notice message test' do
    it 'return notice message' do
      get '/palindroms/index'
      expect(flash[:warning]).to eq('Вы не авторизованы')
    end
  end
end
