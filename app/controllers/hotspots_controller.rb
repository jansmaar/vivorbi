class HotspotsController < ApplicationController
  
  
  def new
  @hotspot = Hotspot.new
  end

  def create
  @hotspot = Hotspot.new(hotspot_params)
  @hotspot.save
  redirect_to hotspots_path

  end

  def update
  end

  def edit
  @hotspot = Hotspot.find(params[:id])
  end

  def destroy
  @hotspot = Hotspot.find(params[:id])
	@hotspot.destroy
	redirect_to hotspots_path
  end

  def index
 
  @hotspots = Hotspot.all
  end

  def show
  @hotspot = Hotspot.find(params[:id])
  end
  
  
  private
  def hotspot_params
    params.require(:hotspot).permit(:title, :content, :ad) if params[:hotspot]
end

end
