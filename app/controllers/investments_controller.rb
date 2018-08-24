class InvestmentsController < ApplicationController
  before_action :total, only: [:wallet, :show, :rejected]
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
    if @investment.risk == false
      flash[:notice] = "Para continuar você deve indicar ciência do termo de risco, marcando a caixa de verificação."
      redirect_to new_offer_investment_path(@investment.offer)
    else
      if @investment.save
        if not @investment.user.qualified
          @investments = Investment.all.where(user_id: current_user.id)
          @offers = Offer.all
          @total_invested = 0
          @investments.each do |investment|
            if investment.status != "rejeitado"
              @total_invested = @total_invested + (investment.amount * investment.offer.pu)
            end
          end
          if @total_invested > 10000
            @investment.status = "rejeitado"
            @investment.update(investment_params)
            redirect_to rejected_path(@investment) and return
          end
        end
        redirect_to investment_path(@investment)
      else
        flash[:notice] = "Não foi possível finalizar sua solicitação."
        render :new
      end
    end
  end

  def edit
    @investment = Investment.find(params[:id])
    @max = set_max(@investment.offer) + @investment.amount
  end

  def update
    @investment = Investment.find(params[:id])
    if @investment.update(investment_params)
      if @investment.photo != nil
        @investment.status = "pendente"
      end
      @investment.update(investment_params)
      flash[:notice] = "Dados alterados."
      redirect_to investment_path(@investment)
    else
      flash[:notice] = "Não foi possível finalizar sua solicitação."
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

  def rejected
    @investment = Investment.find(params[:id])
  end


  private
  def investment_params
    params.require(:investment).permit(:amount, :available, :status, :photo,:risk)
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

  def check

  end



end
