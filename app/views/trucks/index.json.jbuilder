# frozen_string_literal: true

json.pagination do
  json.current_page @pagy.page
  json.next_page @pagy.next
  json.prev_page @pagy.prev
  json.total_pages @pagy.last
  json.total_count @pagy.count
end

json.trucks do
  @truck.each do |truck|
    json.partial! 'trucks/truck', truck:
  end
end
