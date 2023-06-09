class DealCategoriesController < ApplicationController
  def new
    @deal = Deal.new
    @categories = Category.where(user: current_user)
  end

  def create
    puts "Hello, Rails!"
    deal = Deal.create(name: deal_params[:name], author_id: current_user.id, amount: deal_params[:amount])

    if deal.save
      DealCategory.create(deal_id: deal.id, category_id: params[:category])
      redirect_to categories_path(params[:categories])
    else
      flash[:notice] = 'Error during creation'
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
