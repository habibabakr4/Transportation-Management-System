# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :driver
  belongs_to :truck
end
