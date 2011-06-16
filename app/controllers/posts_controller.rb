class PostsController < ApplicationController
  def index
    @title = "Posts"
    @posts = Post.all
  end
  
  def archive
    @posts = Post.from_month(Time.parse "#{params[:month]}/#{params[:year]}").paginate(:page => params[:page], :per_page => 5)
    render :action => 'index'
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
    @tags = params[:tags][:tags].split(", ")
    if @post.save
      @tags.each { |n| @post.tags.create!(:name => n) }
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
