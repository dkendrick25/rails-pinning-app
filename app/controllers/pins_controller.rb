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
  
  def create
  	@pin = Pin.create(pin_params)
  	@pin.save
  end
  
  private
  	def pin_params
  		params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image)
  end
  
  def edit
  @pin = Pin.edit(pin_params)
  end
  
end