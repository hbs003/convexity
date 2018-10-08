class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @enterprise = Enterprise.find(params[:enterprise_id])
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.enterprise = Enterprise.find(params[:enterprise_id])
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @invested = 100*set_max(@offer)
    @investors = investors(@offer)
    session[:last_offer_id] = @offer.id
  end

  private

  def set_max(offer)
    total_invested = Investment.where(status: "pendente").where(offer_id: offer.id).sum(:amount)
  end

  def investors(offer)
    investments = Investment.where(status: "pendente").where(offer_id: offer.id)
  end


  def offer_params
    params.require(:offer).permit(:description, :share, :pu, :units, :enterprise_id)
  end
end
