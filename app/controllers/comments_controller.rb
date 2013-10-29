class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def index
    @comments = Post.find(params[:post_id]).comments.paginate(page: params[:page], per_page: 5)
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = @post.comments.create(params[:comment].permit(:commenter, :body, :password, :password_confirmation))
    redirect_to post_path(@post)
  end
  
  def del
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    
    if comment.authenticate(params[:password])
      comment.destroy
      redirect_to post_path(@post), notice: 'comment delete success!'
    else
      redirect_to del_post_comment_path(params[:post_id], params[:id]), alert: 'password error'
    end
  end


end
