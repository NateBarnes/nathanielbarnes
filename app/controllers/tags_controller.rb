class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_id(params[:id])
    @title = "Posts under #{@tag.name}"
  end

  def create
  end

  def destroy
  end

end
