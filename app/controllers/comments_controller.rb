class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => :destroy
  
  def create
    post = Post.find_by_id(params[:post_id])
    #post.comments.create!( params[:comment] )
    redirect_to posts_path(params[:post_id])
  end

  def destroy
    Comment.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end
