class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @users = User.all
    @post = Post.new
  end

  def post_params
    params.require(:posts).permit(:title, :user_id)
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to action: :index
    end
  end

  def edit
    @post = Post.find(params[:id])
    @users = User.all
  end

  def post_param
    params.require(:post).permit(:title, :user_id)
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_param)
      redirect_to :action => 'show', :id => @post
    else
      @subjects = User.all
      render :action => 'edit'
    end
  end

  def destroy
    post = Post.delete(params[:id])
    authorize post
      redirect_to action: :index, :notice => "post deleted"
  end


  def show_users
    @user = User.find(params[:id])
  end
end
