# frozen_string_literal: true

class Truck < ApplicationRecord
  has_many :assignments
  has_many :drivers, through: :assignments
end
