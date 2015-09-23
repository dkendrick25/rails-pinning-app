class PinsController < ApplicationController
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
  end
  
  def show_by_name
  @pin = Pin.find(params[:slug])
  render :show
  end
  
end