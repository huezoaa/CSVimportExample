class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def importaciones

    begin
      Product.import(params[:file])
      redirect_to root_url, notice: "Products imported"
    rescue
      redirect_to root_url, notice: "Invalid CSV file"
    end

  end
end
