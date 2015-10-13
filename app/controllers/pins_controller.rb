class PinsController < ApplicationController
  before_action :require_login, except: [:show, :index, :show_by_name, :pins]

  def index
    #if current_user.nil?
      @pins = Pin.all #return to showing all pins for pinning
    #else
     #@pins = current_user.pins
    #end
  end

  def show
    #@pin = Pin.find(pin_params)
    @pin = Pin.find(params[:id])
    @users = @pin.users
  end

  def repin
    @pin = Pin.find(params[:id])
    @pin.pinnings.create(user: current_user)
    redirect_to user_path(current_user)
  end 
    



  # Search for a Pin using the slug in the URL
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
   # @users = Pinning.find(@pin)
    @users = @pin.users
    render :show
  end

  # GET /pins/1/edit
  def edit
    @pin = Pin.find(params[:id])
    render :edit
    #edit_pin_path
  end

  #Method to update a pin record
  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
    if @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :edit
    end
  end

# GET /pins/new
  def new
    @pin = Pin.new
    #new_pin_path
  end
  
  # Create a new pin
  def create
    @pin = current_user.pins.new(pin_params)
    if @pin.save
      redirect_to pin_path(@pin)
    else
     @errors = @pin.errors
     render :new
    end
  end

  
    private
    def pin_params
      params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
    end

  
end