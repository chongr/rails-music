class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to bands_url
    else
      redirect_to new_band_url
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      redirect_to edit_band_url
    end
  end

  def destroy
    if Band.find_by(id: params[:id]).destroy
      redirect_to bands_url
    else
      redirect_to bands_url
    end
  end


  private
  def band_params
    params.require(:bands).permit(:name)
  end

end
