class SongsController < ApplicationController
  def index
    if params[:artist_id].present?
      @artist = Artist.find_by(id: params[:artist_id])
      unless @artist
        redirect_to artists_path, alert: "Artist not found" and return
      end
      @songs = @artist.songs
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id].present?
      @artist = Artist.find_by(id: params[:artist_id])

      unless @artist
        return redirect_to artists_path, alert: "Artist not found."
      end

      @song = @artist.songs.find_by(id: params[:id])
      unless @song
        return redirect_to artist_songs_path(@artist), alert: "Song not found for this artist."
      end
    else
      @song = Song.find(params[:id])
    end
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
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
