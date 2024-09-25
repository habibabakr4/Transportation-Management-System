# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Driver, type: :model do
  it 'is valid with valid attributes' do
    driver = Driver.new(email: 'test@example.com', password: 'password')
    expect(driver).to be_valid
  end

  it 'is not valid without an email' do
    driver = Driver.new(email: nil)
    expect(driver).not_to be_valid
  end

  it 'is not valid without a password' do
    driver = Driver.new(password: nil)
    expect(driver).not_to be_valid
  end

end
