class Buttercms::PostsController < Buttercms::BaseController
  def index
    @posts = ButterCMS::Post.all
  end

  def show
    @post = ButterCMS::Post.find(params[:slug])
  end

end
