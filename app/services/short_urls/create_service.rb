module ShortUrls
  class CreateService < ApplicationService
    def call
      create_short_url
    end

    private

    def create_short_url
      short_url = host_param + '/s/' + slug_param

      attributes = {
        original_url: original_url_param,
        short_url: short_url,
        slug: slug_param
      }

      Url.create(attributes)
    end

    def original_url_param
      params[:original_url].presence
    end

    def host_param
      params[:host].presence
    end

    def slug_param
      params[:slug].presence
    end
  end
end
