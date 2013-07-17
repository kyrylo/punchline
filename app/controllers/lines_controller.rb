class LinesController < ApplicationController

  def new
    @lyric     = Lyric.find(params[:lyric_id])
    @line      = @lyric.lines.build(text: params[:text])
    @line_text = @line.text
  end

  def create
    @line = Line.new(params[:line])
    @line.explanation_attributes = params[:explanation]

    respond_to do |format|
      if @line.save
        format.html { redirect_to root_url }
      else
        format.html { render action: 'new' }
      end
    end
  end

end
