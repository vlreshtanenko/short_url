module Clicks
  class StatsService < ApplicationService
    def call
      get_stats
    end

    private

    def get_stats
      Click.reindex
      clicks = Click.search(slug_param).to_a

      lambda_array_by_key = -> (h, k) {h[k] = []}

      by_oses = Hash.new(&lambda_array_by_key)
      by_platforms = Hash.new(&lambda_array_by_key)
      by_countries = Hash.new(&lambda_array_by_key)
      by_dates = Hash.new(&lambda_array_by_key)

      clicks.each do |click|
        by_oses[click.operating_system] << click
        by_platforms[click.platform] << click
        by_countries[click.country] << click
        by_dates[click.date] << click
      end

      {
        by_oses: by_oses.transform_keys(&:to_s),
        by_platforms: by_platforms.transform_keys(&:to_s),
        by_countries: by_countries.transform_keys(&:to_s),
        by_dates: by_dates.transform_keys(&:to_s)
      }
    end

    def slug_param
      params[:slug].presence
    end
  end
end
