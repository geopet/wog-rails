class Forecast

  def initialize(parsed_json)
    @parsed_json = parsed_json
  end

  def city
    @parsed_json['current_observation']['display_location']['full']
  end

  def temp_string
    @parsed_json['current_observation']['temperature_string']
  end

  def temp_f
    @parsed_json['current_observation']['temp_f']
  end

  def forecast_icon_url
    @parsed_json['current_observation']['icon_url']
  end

  def relative_humidity
    @parsed_json['current_observation']['relative_humidity']
  end

  def current_conditions
    @parsed_json['current_observation']['weather']
  end

  def alerts
    @parsed_json['alerts']
  end

  def no_alerts?
    @parsed_json['alerts'][0].nil?
  end

  def alerts_count
    @parsed_json['alerts'].count
  end

  def radar
    @parsed_json['radar']['image_url']
  end

  def wind
    @parsed_json['current_observation']['wind_string']
  end

  def sunrise
    hour = @parsed_json['moon_phase']['sunrise']['hour']
    minute = @parsed_json['moon_phase']['sunrise']['minute']
    "#{hour}:#{minute} am"
  end

  def sunset
    hour = @parsed_json['moon_phase']['sunset']['hour']
    minute = @parsed_json['moon_phase']['sunset']['minute']
    "#{hour}:#{minute} pm"
  end

  def daily_forecast
    @parsed_json['forecast']['simpleforecast']['forecastday']
  end

  def txt_forecast(period)
    @parsed_json['forecast']['txt_forecast']['forecastday'][period]['fcttext']
  end

  def daily_forecast_display(daily)
    period = daily['period']
    forecast_text = self.txt_forecast(period)
    day = daily['date']['weekday']
    high = daily['high']['fahrenheit']
    low = daily['low']['fahrenheit']
    "#{day} #{high}&deg; F/#{low}&deg; F #{forecast_text}"
  end

end
