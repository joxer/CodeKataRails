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
    @concert = Concert.new(concert_params)
    if @concert.save
      render json: { status: :created }
    else
      #format.html { render :new }
      render json:  {  errors: @concert.errors }
    end
  end

  def update
      if @concert.update(concert_params)
        render json: {status: updated}
      else
        render json: {errors: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @concert.destroy
    json { status :destroyed }
    
  end

  private
    def set_concert
      @concert = Concert.find(params[:id])
    end

    def concert_params
      params.require(:concert).permit(:position, :band_id, :location)
    end
end
