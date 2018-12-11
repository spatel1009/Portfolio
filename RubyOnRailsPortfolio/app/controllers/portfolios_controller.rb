class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.create(portfolio_params)
      if @portfolio_item.save
        redirect_to @portfolio_item, notice: 'Your portfolio item was created!'
      else
        render 'new'
      end
  end

  def show
  end



  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image, :main_image)
  end
end
