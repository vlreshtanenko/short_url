module ShortUrls
  class FindService < ApplicationService
    def call
      find_short_url
    end

    private

    def find_short_url
      url = Url.find_by(slug: slug_param)

      url.update_attribute(:clicks_count, url.clicks_count + 1)
      url
    end

    def slug_param
      params[:slug].presence
    end
  end
end
