require 'buttercms-ruby'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @offers = Offer.all.order("created_at DESC").first(3)
  end

  def coming_soon
  end

  def faq

  end

  def test

  end

  def risk

  end

  def contact
    @user = current_user
  end




end
