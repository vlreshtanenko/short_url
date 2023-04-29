module ShortUrls
  class CreateService < ApplicationService
    def call
      create_short_url
    end

    private

    def create_short_url
      slug = request_param.uuid[0..7]

      host = request_param.host_with_port
      short_url = host + '/s/' + slug

      attributes = {
        original_url: original_url_param,
        short_url: short_url,
        slug: slug
      }

      Url.create(attributes)
    end

    def original_url_param
      params[:original_url].presence
    end

    def request_param
      params[:request].presence
    end
  end
end
