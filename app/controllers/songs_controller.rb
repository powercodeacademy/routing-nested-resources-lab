class SongsController < ApplicationController
  def index
    @songs = if params[:artist_id]
               return redirect_to_artists unless artist_id_present_and_valid?

               Artist.find(params[:artist_id]).songs
             else
               Song.all
             end
  end

  def show
    return redirect_to_artist_songs if params[:artist_id] && !Song.find_by(id: params[:id])

    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = 'Song deleted.'
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

  def redirect_to_artists
    redirect_to artists_path
    flash[:alert] = 'Artist not found.'
  end

  def artist_id_present_and_valid?
    params[:artist_id] && Artist.find_by(id: params[:artist_id])
  end

  def redirect_to_artist_songs
    redirect_to artist_songs_path(params[:artist_id])
    flash[:alert] = 'Song not found.'
  end
end
