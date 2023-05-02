class ClicksController < ApplicationController
  def stats
    stats = Clicks::StatsService.perform(stats_params)

    @by_oses = stats[:by_oses]
    @by_platforms = stats[:by_platforms]
    @by_countries = stats[:by_countries]
    @by_dates = stats[:by_dates]
    # render_response(stats[:by_oses].first.values.first)
  end

  private

  def stats_params
    params.permit(:slug)
  end
end
