# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email).with_message("can't be blank") }
    it { should validate_presence_of(:login).with_message("can't be blank") }
    it { should validate_presence_of(:password).with_message("can't be blank") }
  end
end