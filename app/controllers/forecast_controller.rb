class ForecastController < ApplicationController

  def show
    forecast_json = ForecastGenerator.new(params[:zip]).fetch_json
    @forecast = Forecast.new(forecast_json)
  end

  def index
  end

end
