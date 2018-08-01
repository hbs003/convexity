class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: [:show, :edit, :update, :destroy]
  def index
    @enterprises = Enterprise.all
  end

  def new
    @enterprise = Enterprise.new
  end

  def create
    @enterprise = Enterprise.new(enterprise_params)
    if @enterprise.save
      redirect_to enterprise_path(@enterprise)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @enterprise.update(enterprise_params)
    redirect_to enterprise_path(@enterprise)
  end

  def show
  end

  def destroy
    @enterprise.destroy
    redirect_to enterprises_path
  end

  private
  def enterprise_params
    params.require(:enterprise).permit(:name, :abstract, :founder_id)
  end

  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end
end
