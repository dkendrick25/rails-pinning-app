class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
  end

  def show_by_name
  	@pin = Pin.find_by_slug(params[:slug])
  	render :show
  end

  def new
    @pin = Pin.new
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      redirect_to pin_path(@pin)
    else
      @error = @pin.errors
      render :edit
    end
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.valid?
      @pin.save
      redirect_to pin_path(@pin)
    else
      @error = @pin.errors
      render :new
    end
  end


private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image)
  end
  
end