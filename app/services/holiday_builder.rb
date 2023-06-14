require "httparty"
require "json"

class HolidayBuilder
  def self.get_next_holidays
    response = HTTParty.get("https://date.nager.at/api/v3/NextPublicHolidays/us")
    parsed = JSON.parse(response.body, symbolize_names: true)
      holidays = parsed.map do |data|
        Holiday.new(data)
      end
    holidays.first(3)
  end
end