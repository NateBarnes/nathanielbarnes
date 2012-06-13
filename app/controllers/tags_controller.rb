class TagsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]
  
  def show
    @tag = Tag.find_by_id(params[:id])
    @posts = @tag.posts.paginate :page => params[:page], :per_page => 5
    @title = "Posts under #{@tag.name}"
  end

  def create
  end

  def destroy
  end

end
