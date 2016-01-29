class AlbumsController < ApplicationController
  def create
    album = Album.new(album_params)

    if album.save
      redirect_to album_url(album)
    else
      redirect_to new_band_album_url
    end
  end

  def new
  end

  def show
    @album = Album.find_by(id: params[:id])
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def update
    album = Album.find_by(id: params[:id])

    if album.update(album_params)
      redirect_to album_url(album)
    else
      redirect_to edit_album_url
    end
  end

  def destroy
    band = Album.find_by(id: params[:id]).band
    
    if Album.find_by(id: params[:id]).destroy
      redirect_to band_url(band)
    else
      redirect_to band_url(band)
    end
  end

  private
  def album_params
    params.require(:albums).permit(:name, :band_id, :album_type)
  end
end
