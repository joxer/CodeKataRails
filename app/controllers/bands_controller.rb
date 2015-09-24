class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]
  before_filter :login_user, :only: [:create, :update, :destroy,:new]

  def index
    @bands = Band.all
    render json: @bands
  end

  def show
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def create
    if @user.isAdmin?
      @band = Band.new(band_params)

      if @band.save
        render json: { status: :created }
      else
        render json: {errors: @band.errors, status: :unprocessable_entity }
      end
    else
      render json: failed_user_not_admin_json
    end
  end

  def update
    if @user.isAdmin?
      if @band.update(band_params)
        render json: { status: :updated }
      else
        render json: { errors: @band.errors, status: :unprocessable_entity }
      end
    else
      render json: failed_user_not_admin_json
    end
  end

  def destroy
    if @user.isAdmin?
      @band.destroy
      render json: { status: :destroyed }
    else
      render json: failed_user_not_admin_json
    end
  end

  private
    def set_band
      @band = Band.find(params[:id])
    end

    def band_params
      params.require(:band).permit(:name, :description)
    end
end
