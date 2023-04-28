module Clicks
  class CreateService < ApplicationService
    def call
      create_click
    end

    private

    def create_click
      browser = Browser.new(request_param.env['HTTP_USER_AGENT'])

      operating_system = browser.platform
      platform = browser.device
      source = request_param.ip
      country = ''

      request_param.env['HTTP_USER_AGENT']
      attributes = {
        platform: platform,
        country: country,
        operating_system: operating_system,
        source: source,
        url: params[:url],
        slug: params[:url].slug
      }

      # Url.create(attributes)
    end

    def original_url_param
      params[:original_url].presence
    end

    def request_param
      params[:request].presence
    end
  end
end
