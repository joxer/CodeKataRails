class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  before_filter :login_user, only: [:create, :update, :destroy, :new]

  def index
    @concerts = Concert.all
    render json: @concerts
  end

  def show
    render json: @concert
  end

  def new
    @concert = Concert.new
  end

  def edit
  end


  def create

    if @user != nil
      @concert = Concert.new(concert_params)
      @concert.user = @user
      @concert.band = Band.find(params[:band_id])
      
      if @concert.save
        render json: { status: :created }
      else
        render json:  {  errors: @concert.errors }
      end
      
    else
      render json: failed_user_json
    end
  end
  
  def update
    
    if @user.isAdmin? ||  @concert.user == @user
      if @concert.update(concert_params)
        render json: {status: :updated}
      else
        render json: {errors: @concert.errors, status: :unprocessable_entity }
      end
    else
      render json: failed_user_json
    end
  end
  
  def destroy
    if @user.isAdmin? ||  @concert.user == @user
      @concert.destroy
      render json: { status: :destroyed }
    else
      render json: failed_user_json
    end
    
  end

  private
    def set_concert
      @concert = Concert.find(params[:id])
    end

    def concert_params
      params.require(:concert).permit(:position, :band_id, :location)
    end
end
