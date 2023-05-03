class UrlsController < ApplicationController
  before_action :set_url, only: %i[ show edit update destroy ]

  # GET /urls or /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls or /urls.json
  def create
    service_params = url_params.merge({
      host: ENV['HOST'],
      slug: request.uuid[0..7]
    })

    @url = ShortUrls::CreateService.perform(service_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to url_url(@url), notice: "Url was successfully created." }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirect
    url = ShortUrls::FindService.perform(redirect_params)
    clicks_params = {
      request: request,
      url_id: url.id,
      slug: url.slug
    }

    Clicks::CreateService.perform(clicks_params)
    redirect_to(url.original_url, allow_other_host: true)
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:original_url, :short_url, :slug, :clicks_count, :unique_clicks_count)
  end

  def redirect_params
    params.permit(:slug)
  end

  def create_params
    params.permit(:original_url)
  end

  def stats_params
    params.permit(:slug)
  end
end
