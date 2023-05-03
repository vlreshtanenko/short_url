module Clicks
  class CreateService < ApplicationService
    def call
      create_click
    end

    private

    def create_click
      browser = Browser.new(request_param.env['HTTP_USER_AGENT'])

      operating_system = browser.platform.name
      platform = browser.device.name
      source = request_param.remote_ip
      country = request_param.location.country || 'XX'

      attributes = {
        platform: platform,
        country: country,
        operating_system: operating_system,
        source: source,
        url_id: params[:url_id],
        slug: params[:slug],
        date: Date.today
      }

      Click.create(attributes)
    end

    def original_url_param
      params[:original_url].presence
    end

    def request_param
      params[:request].presence
    end
  end
end
