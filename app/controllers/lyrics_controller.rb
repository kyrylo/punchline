class LyricsController < ApplicationController
  # GET /lyrics
  # GET /lyrics.json
  def index
    @lyrics = Lyric.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lyrics }
    end
  end

  # GET /lyrics/1
  # GET /lyrics/1.json
  def show
    @lyric = Lyric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lyric }
    end
  end

  # GET /lyrics/new
  # GET /lyrics/new.json
  def new
    @lyric = Lyric.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lyric }
    end
  end

  # GET /lyrics/1/edit
  def edit
    @lyric = Lyric.find(params[:id])
  end

  # POST /lyrics
  # POST /lyrics.json
  def create
    @lyric = Lyric.new(params[:lyric])

    respond_to do |format|
      if @lyric.save
        format.html { redirect_to @lyric, notice: 'Lyric was successfully created.' }
        format.json { render json: @lyric, status: :created, location: @lyric }
      else
        format.html { render action: "new" }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lyrics/1
  # PUT /lyrics/1.json
  def update
    @lyric = Lyric.find(params[:id])

    respond_to do |format|
      if @lyric.update_attributes(params[:lyric])
        format.html { redirect_to @lyric, notice: 'Lyric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lyric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lyrics/1
  # DELETE /lyrics/1.json
  def destroy
    @lyric = Lyric.find(params[:id])
    @lyric.destroy

    respond_to do |format|
      format.html { redirect_to lyrics_url }
      format.json { head :no_content }
    end
  end
end
