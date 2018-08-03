class FoundersController < ApplicationController
  def index
    @founders = Founder.all
  end

  def new
    @enterprise = Enterprise.find(params[:enterprise_id])
    @founder = Founder.new
  end

  def create
    @founder = Founder.new(founder_params)
    @founder.enterprise = Enterprise.find(params[:enterprise_id])
    if @founder.save
      redirect_to founder_path(@founder)
    else
      render :new
    end
  end

  def edit
    @founder = Founder.find(params[:id])
  end

  def update
    @founder = Founder.find(params[:id])
    if @founder.update(founder_params)
      redirect_to founder_path(@founder)
    else
      render :edit
    end
  end

  def show
    @founder = Founder.find(params[:id])

  end

  def destroy
    @founder = Founder.find(params[:id])
    enterprise_save = @founder.enterprise
    @founder.destroy
    redirect_to enterprise_path(enterprise_save)
  end

  private

  def founder_params
    params.require(:founder).permit(:name, :description, :function, :enterprise_id)
  end
end
