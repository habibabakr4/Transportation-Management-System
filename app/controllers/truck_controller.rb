# frozen_string_literal: true

# This class manages truck-related actions such as listing and assigning trucks.
class TrucksController < ApplicationController
  include Pagy::Backend
  before_action :authorize_request

  def index
    @pagy, @trucks = pagy(Truck.all)
    render json: index
  end
end
