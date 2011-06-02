class PostsController < ApplicationController
  def index
    @title = "Posts"
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
    @title = @post.title
  end

  def new
    @title = "New Post"
  end

  def edit
    @title = "Edit Post"
  end

  def create
    
  end

  def destroy
  end

end
