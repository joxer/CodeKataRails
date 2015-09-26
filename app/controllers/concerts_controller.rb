class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  before_filter :login_user, only: [:create, :update, :destroy, :new]

  def index
    @concerts = Concert.where(band_id: params[:band_id])
    respond_to do |format|
      format.json #{ render json: @concerts.to_json(:only => [:id, :position,:location])}
      format.html 
    end
  end

  def show
    respond_to do |format|
      format.json
    end
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
        respond_to do |format|
          format.json { render json: { status: :created, concert: @concert.pretty_json }}
          format.html
        end
          
      else
        respond_to do |format|
          render json:  {  errors: @concert.errors }
          render html
        end
      end
      
    else
      render json: failed_user_json
    end
  end
  
  def update
    
    if @user.isAdmin? ||  @concert.user == @user
      if @concert.update(concert_params)
        respond_to do |format|
          format.json { render json: {status: :updated, concert: @concert.pretty_json} }
          format.html
        end
      else
        respond_to do |format|
          format.json { render json: {errors: @concert.errors, status: :unprocessable_entity } }
          format.html
        end
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
