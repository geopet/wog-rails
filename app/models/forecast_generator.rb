class ForecastGenerator
  require 'rest_client'
  require 'json'

  def initialize(zip)
    @zip = zip
    @key = ENV['WEATHERKEY']
  end

  def fetch_json
    url = "http://api.wunderground.com/api/#{@key}/alerts/radar/conditions/forecast/astronomy/q/#{@zip}.json"
    #resp = RestClient.get url
    json_string = RestClient.get url
    #json_string = resp.read
    #json_string = JSONDATA03

    JSON.parse(json_string)
  end
end
