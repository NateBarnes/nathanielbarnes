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
    @post = Post.new
  end

  def edit
    @title = "Edit Post"
  end

  def create
    @post = Post.new(params[:post].merge(:user_id => 1))
    if @post.save
      flash[:success] = "Post Successfuly Saved"
      redirect_to @post
    else
      @title = "New Post"
      render "new"
    end
  end

  def destroy
  end

end
