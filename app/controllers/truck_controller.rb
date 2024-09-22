class TrucksController < ApplicationController
    include Pagy::Backend
    before_action :authorize_request
  
    def index
        @pagy, @trucks = pagy(Truck.all)
        render json: index
    end
  end
  