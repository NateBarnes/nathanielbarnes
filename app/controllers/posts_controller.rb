class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :create, :destroy]
  
  def index
    @title = "Posts"
    @posts = user_signed_in? ? Post.all.paginate(:page => params[:page], :per_page => 5) : Post.published.paginate(:page => params[:page], :per_page => 5)
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
    @post = Post.find_by_id(params[:id])
    @title = "Edit Post"
  end

  def create
    @post = Post.new(params[:post].merge(:user_id => 1))
    @tags = params[:tags][:tags].split(", ")
    if @post.save
      @tags.each do |n|
        if Tag.find_by_name(n).nil?
          @post.tags.create!(:name => n) unless Tag.find_by_name(n)
        else
          t = Tag.find_by_name(n)
          TagTrack.create!(:post_id => @post.id, :tag_id => t.id)
        end
      end
      flash[:success] = "Post Successfuly Saved"
      redirect_to @post
    else
      @title = "New Post"
      render "new"
    end
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Profile updated"
      redirect_to @post
    else
      @title = "Edit post"
      render 'edit'
    end
  end

  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to root_path
  end

end
