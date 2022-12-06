# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing Autorization
RSpec.describe UsersController do
  include RSpec::Expectations
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @password = '12345'
    @base_url = 'http://localhost:3000/palindroms/index'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
  end

  it 'should get a flash message' do
    @driver.get(@base_url)
    expect((@driver.find_element(:id, 'msg').text)).to eq('Вы не авторизованы')
  end
end
