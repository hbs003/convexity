class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.all.order("created_at DESC")
  end

  def coming_soon
  end


end
