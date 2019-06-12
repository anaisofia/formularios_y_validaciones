class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
      if @sale.tax == 1
        taxes = @sale.value - (@sale.value * 19/100)
        Sale.new(sale_params)
      else
        @sale.value - @sale.discount
      end


    if @sale.save
      redirect_to sales_done_path
    else
      render :new
    end
  end

  def done
    @sale = Sale.last
  end

  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
