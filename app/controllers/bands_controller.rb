class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]
  before_filter :login_user, only: [:index, :create, :update, :destroy]

  def index

    @bands = Band.all
    respond_to do |format|
      format.json # { render json: @bands.to_json(:only => [:id, :name, :description])}
      format.html
    end
  end

  def show
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def create
    if @user != nil && @user.isAdmin?
      @band = Band.new(band_params)

      if @band.save
        respond_to do |format|
          format.json {render json: { status: :created, band:  @band.pretty_json }}
          format.html
        end
      else
        respond_to do |format|
          format.json { render json: {errors: @band.errors, status: :unprocessable_entity }}
          format.html
        end
      end
    else
      respond_to do |format|
        format.json { render json: failed_user_not_admin_json}
        format.html
      end
    end
  end

  def update
    if @user != nil && @user.isAdmin?
      if @band.update(band_params)
        respond_to do |format|
          format.json {render json: { status: :updated, band:  @band.pretty_json }}
          format.html {redirect_to bands_path}

        end
      else
        respond_to do |format|
          format.json { render json: { errors: @band.errors, status: :unprocessable_entity }}
          format.html
        end
      end
    else
      respond_to do |format|
        format.json { render json: failed_user_not_admin_json}
      end
    end
  end

  def destroy
    if  @user != nil && @user.isAdmin?
      @band.concerts.each {|concert| concert.destroy }
      @band.destroy
      
      respond_to do |format|
        format.json { render json: { status: :destroyed }}
        format.html {redirect_to bands_path}
      end
    else
      respond_to do |format|
        format.json { render json: failed_user_not_admin_json}
        format.html
      end
    end
  end

  private
    def set_band
      begin
        @band = Band.find(params[:id])
      rescue
        respond_to do |format|
          format.json {render json: {errors: "Band doesn't exist"}}
          format.html {redirect_to bands_path}
        end
      end


    end

    def band_params
      params.require(:band).permit(:name, :description)
    end
end
