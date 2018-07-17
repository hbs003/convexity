class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = Post.all.order("created_at DESC")
  end

  def coming_soon
  end

  def adm_painel
    @subscribers = Subscriber.all.order("created_at DESC")
    @posts = Post.all.order("created_at DESC")
  end


end
