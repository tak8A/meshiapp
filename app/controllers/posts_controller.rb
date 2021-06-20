class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
    #Rails.logger.debug "@post : #{@post.inspect}"
      #flash[:success] =  "投稿しました"
      redirect_to @post, success: 'succress create task'

    else
      flash[:warning] =  "投稿に誤りがあります"
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
       flash[:notice] = "投稿を編集しました"
       redirect_to @post
    else  
       render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to @post
  end

end
