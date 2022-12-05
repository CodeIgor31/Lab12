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

  it 'check url of page' do
    @driver.get(@base_url)
    expect(@driver.current_url).to eq('http://localhost:3000/')
  end

  it 'should sign up and get an answer' do
    @driver.get('http://localhost:3000/users/new')
    @driver.find_element(:id, 'email').send_keys 'petrA@mail.ru'
    @driver.find_element(:id, 'login').send_keys 'Testing'
    @driver.find_element(:id, 'pass').send_keys @password
    @driver.find_element(:id, 'pass_conf').send_keys @password
    @driver.find_element(:id, 'btn').click
    @driver.find_element(:id, 'num').send_keys '100'
    @driver.find_element(:id, 'find').click
    verify { expect((@driver.find_element(:id, 'counter').text)).to eq('6') }
  end

  def verify
    yield
  rescue ExpectationNotMetError => e
    @verification_errors << e
  end
end
