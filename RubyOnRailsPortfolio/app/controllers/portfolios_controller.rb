class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def java
    @java_portfolio_items = Portfolio.java
  end

  def create
    @portfolio_item = Portfolio.create(portfolio_params)
      if @portfolio_item.save
        redirect_to portfolios_path, notice: 'Your portfolio item was created!'
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if @portfolio_item.update(portfolio_params)
      redirect_to portfolios_path, notice: 'Your portfolio item was edited!'
    else
      render :new
    end
  end

  def destroy
    if @portfolio_item.destroy
      redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed!'
    else
      render :new
    end
  end

  private

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image, :main_image)
  end
end