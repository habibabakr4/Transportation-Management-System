# frozen_string_literal: true

class FetchTrucksWorkerJob < ApplicationJob
  queue_as :default

  include Sidekiq::Worker

  API_URL = 'https://api-task-bfrm.onrender.com/api/v1/trucks'
  API_KEY = 'illa-trucks-2023'

  def perform
    page = 1
    loop do
      response = fetch_trucks(page)
      break if response.nil?

      save_trucks(response['trucks'])
      page += 1

      break if page > response['total_pages']
    end
  end

  private

  def fetch_trucks(page)
    response = HTTParty.get(API_URL, headers: { 'API_KEY' => API_KEY }, query: { page: })

    return unless response.success?

    {
      'trucks' => response.parsed_response['data'],
      'total_pages' => response.headers['total-pages'].to_i
    }
  end

  def save_trucks(trucks)
    trucks.each do |truck_data|
      Truck.find_or_create_by(
        name: truck_data['name'],
        truck_type: truck_data['truck_type']
      )
    end
  end
end
