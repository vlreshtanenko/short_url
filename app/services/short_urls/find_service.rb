module ShortUrls
  class FindService < ApplicationService
    def call
      find_short_url
    end

    private

    def find_short_url
      url = Url.find_by(slug: slug_param)
    end

    def slug_param
      params[:slug].presence
    end
  end
end
