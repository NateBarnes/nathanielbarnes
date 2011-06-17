class CommentsController < ApplicationController
  def create
    post = Post.find_by_id(params[:post_id])
    post.comments.create!( params[:comment] )
    redirect_to posts_path(params[:post_id])
  end

  def destroy
  end

end
