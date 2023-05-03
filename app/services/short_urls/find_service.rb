module ShortUrls
  class FindService < ApplicationService
    def call
      find_short_url
    end

    private

    def find_short_url
      Url.searchkick_index.refresh
      url = Url.search(slug_param, limit: 1).first
    end

    def slug_param
      params[:slug].presence
    end
  end
end
