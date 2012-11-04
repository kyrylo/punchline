class LyricsController < ApplicationController
  before_filter :find_artist

  def index
    @lyrics = @artist.lyrics.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lyrics }
    end
  end

  def show
    @lyric = @artist.lyrics.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lyric }
    end
  end

  def new
    @lyric = @artist.lyrics.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lyric }
    end
  end

  def edit
    @lyric = @artist.lyrics.find(params[:id])
  end

  def create
    @lyric = @artist.lyrics.build(params[:lyric])

    respond_to do |format|
      if @lyric.save
        format.html {
          redirect_to artist_lyric_url(@artist, @lyric),
                      notice: 'Lyric was successfully created.'
        }
        format.json { render json: @lyric, status: :created, location: @lyric }
      else
        format.html { render action: "new" }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lyric = @artist.lyrics.find(params[:id])

    respond_to do |format|
      if @lyric.update_attributes(params[:lyric])
        format.html {
          redirect_to artist_lyric_url(@artist, @lyric),
                      notice: 'Lyric was successfully updated.'
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lyric = @artist.lyrics.find(params[:id])
    @lyric.destroy

    respond_to do |format|
      format.html { redirect_to artist_lyrics_url }
      format.json { head :no_content }
    end
  end

  private

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end
end
