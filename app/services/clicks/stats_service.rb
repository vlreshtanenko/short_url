module Clicks
  class StatsService < ApplicationService
    def call
      get_stats
    end

    private

    def get_stats
      Click.reindex
      clicks = Click.search(slug_param).to_a

      uniq_oses = clicks.to_a.map(&:operating_system).uniq
      uniq_platforms = clicks.to_a.map(&:platform).uniq
      uniq_countries = clicks.to_a.map(&:country).uniq
      uniq_dates = clicks.to_a.map(&:date).uniq

      clicks_by_oses = uniq_oses.map do |os|
        Click.reindex
        { "#{os}": Click.search(os).to_a }
      end

      clicks_by_platforms = uniq_platforms.map do |platform|
        Click.reindex
        { "#{platform}": Click.search(platform).to_a }
      end

      clicks_by_countries = uniq_countries.map do |country|
        Click.reindex
        { "#{country}": Click.search(country).to_a }
      end

      clicks_by_dates = uniq_dates.map do |date|
        Click.reindex
        { "#{date}": Click.search(date).to_a }
      end

      {
        by_oses: clicks_by_oses,
        by_platforms: clicks_by_platforms,
        by_countries: clicks_by_countries,
        by_dates: clicks_by_dates
      }
    end

    def slug_param
      params[:slug].presence
    end
  end
end
