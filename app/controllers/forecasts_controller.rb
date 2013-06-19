class ForecastsController < ApplicationController

  def show
    forecast_json = ForecastGenerator.new(params[:id]).fetch_json
    @forecast = Forecast.new(forecast_json)
  end

  def index
  end

end
