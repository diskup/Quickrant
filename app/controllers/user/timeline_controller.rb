class User::TimelineController < ApplicationController
  
  def index
    @timelines = Timeline.all
  end
  def create
    @timeline = Timeline.new(timeline_params)
  end
  private
  def timeline_params
    params.require(:timeline).permit(:post_image, :content)
  end 
end
