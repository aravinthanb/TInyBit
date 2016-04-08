class PostsController < ApplicationController
  before_filter :logged_in_user, only: [:create,:destroy]

  def Home
    @post  = current_user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_param)
    if @post.save
      redirect_to root_url
      flash["alert alert-success"] = "Bit Posted"
    else
      redirect_to root_url
      flash["alert alert-danger"] = @post.errors.full_messages
    end
  end

  def destroy
  end

private

def post_param
  params.require(:post).permit(:content)
end

end
