class UrlShortsController < ApplicationController
  before_action :set_url_short, only: [:show, :edit, :update, :destroy]

  # GET /url_shorts
  # GET /url_shorts.json
  def index
    @url_shorts = UrlShort.all
  end

  # GET /url_shorts/1
  # GET /url_shorts/1.json
  def show
  end

  # GET /url_shorts/new
  def new
    @url_short = UrlShort.new
  end

  # GET /url_shorts/1/edit
  def edit
  end

  def  view_page
    @url_short = UrlShort.find_by(short_url: params[:rgs])
    redirect_to @url_short.original_url 
  end

  # POST /url_shorts
  # POST /url_shorts.json
  def create
    @url_short = UrlShort.new(url_short_params)
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    string = (0...8).map { o[rand(o.length)] }.join
    @url_short.short_url = string


    respond_to do |format|
      if @url_short.save
        format.html { redirect_to @url_short, notice: 'Url short was successfully created.' }
        format.json { render :show, status: :created, location: @url_short }
      else
        format.html { render :new }
        format.json { render json: @url_short.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_shorts/1
  # PATCH/PUT /url_shorts/1.json
  def update
    respond_to do |format|
      if @url_short.update(url_short_params)
        format.html { redirect_to @url_short, notice: 'Url short was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_short }
      else
        format.html { render :edit }
        format.json { render json: @url_short.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_shorts/1
  # DELETE /url_shorts/1.json
  def destroy
    @url_short.destroy
    respond_to do |format|
      format.html { redirect_to url_shorts_url, notice: 'Url short was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_short
      @url_short = UrlShort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_short_params
      params.require(:url_short).permit(:original_url, :short_url)
    end
end
