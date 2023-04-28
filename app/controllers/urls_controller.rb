class UrlsController < ApplicationController
  before_action :set_url, only: %i[ show edit update destroy ]

  # GET /urls or /urls.json
  def index
    @urls = Url.all
  end

  # # GET /urls/1 or /urls/1.json
  # def show
  # end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls or /urls.json
  def create
    @url = ShortUrls::CreateService.perform(url_params.merge(request: request))

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

  # PATCH/PUT /urls/1 or /urls/1.json
  # def update
  #   respond_to do |format|
  #     if @url.update(url_params)
  #       format.html { redirect_to url_url(@url), notice: "Url was successfully updated." }
  #       format.json { render :show, status: :ok, location: @url }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @url.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /urls/1 or /urls/1.json
  # def destroy
  #   @url.destroy

  #   respond_to do |format|
  #     format.html { redirect_to urls_url, notice: "Url was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  def redirect
    url = ShortUrls::FindService.perform(redirect_params)
    # clicks_params = {

    # }

    # Clicks::CreateService.perform(clicks_params)
    redirect_to(url.original_url, allow_other_host: true)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_url
    @url = Url.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
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
