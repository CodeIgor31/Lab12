# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController do
    include RSpec::Expectations
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @password = '12345'
      @base_url = 'http://localhost:3000/'
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
    end
  
    after(:each) do
      @driver.quit
    end

    it 'should login and get an answer' do
      @driver.get(@base_url)
      @driver.find_element(:id, 'log_mail').send_keys 'igor.yagmurov@mail.ru'
      @driver.find_element(:id, 'log_pass').send_keys @password
      @driver.find_element(:id, 'log_btn').click
      @driver.find_element(:id, 'num').send_keys '100'
      @driver.find_element(:id, 'find').click
      expect((@driver.find_element(:id, 'counter').text)).to eq('6')
    end
  end