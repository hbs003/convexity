class InvestmentsController < ApplicationController
  before_action :total, only: [:wallet, :show]
  def index
    @offer = Offer.find(params[:offer_id])
    @investments = Investment.all.where(offer_id: @offer.id)
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @investments = Investment.all.where(offer_id: @offer.id)
    @investment = Investment.new
    @max = set_max(@offer)
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.offer = Offer.find(params[:offer_id])
    @investment.user = current_user
    @investment.status = "pendente"
    if @investment.save
      redirect_to investment_path(@investment)
    else
      render :new
    end
  end

  def edit
    @investment = Investment.find(params[:id])
    @max = set_max(@investment.offer) + @investment.amount
  end

  def update
    @investment = Investment.find(params[:id])
    if @investment.update(investment_params)
      redirect_to investment_path(@investment)
    else
      render :edit
    end
  end

  def destroy
    @investment = Investment.find(params[:id])
    @investment.destroy
    redirect_to wallet_path
  end

  def show
    @investment = Investment.find(params[:id])
  end

  def wallet
  end


  private
  def investment_params
    params.require(:investment).permit(:amount, :available, :status)
  end

  def set_max(offer)
    total_invested = Investment.where(status: "pendente").where(offer_id: offer.id).sum(:amount)
    max = offer.units - total_invested
  end

  def total
    @investments = Investment.all.where(user_id: current_user.id)
    @offers = Offer.all
    @total_invested = 0
    @investments.each do |investment|
      if investment.status != "rejeitado"
        @total_invested = @total_invested + (investment.amount * investment.offer.pu)
      end
    end
  end


end
