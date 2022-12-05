# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Palindrom, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:num).with_message('не может быть пустым') }

    context 'when numb is not a digit' do
      it { should_not allow_value(Faker::Lorem.word).for(:num) }
    end

    context 'when num is a digit' do
      it { should allow_value(Faker::Number.number).for(:num) }
    end
  end

  describe '#print_res' do
    let(:num_val) { 11 }
    let(:params) { { num: num_val } }

    subject { described_class.new(params) }

    context 'valid value' do
      flag = false
      it 'right answer' do
        expect(subject.print_res).to eq({0=>0, 1=>1, 2=>4, 3=>9, 11=>121})
      end
    end
end
describe '#print_res' do
    let(:num_val) { -1 }
    let(:params) { { num: num_val } }

    subject { described_class.new(params) }

    context 'invalid value' do
        flag = false
        it 'wrong answer' do
          expect(subject.print_res).to eq(nil)
        end
      end
  end
end