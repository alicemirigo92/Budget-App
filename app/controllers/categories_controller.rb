class CategoriesController < ApplicationController
  before_action :authenticate_user!

  # GET /categories or /categories.json
  def index
    @categories = Category.where(user: current_user).includes(:deal_categories).order(created_at: :desc).limit(4)
    @name = current_user.name
  end

  def older_index
    @categories = Category.where(user: current_user).includes(:deal_categories).order(created_at: :asc)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    @deal_categories = DealCategory.includes(:deal).where(category_id: @category).order(created_at: :desc)
    @total = 0
    @deal_categories.each { |e| @total += e.deal.amount }
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    category = Category.new(category_params)
    category.user = current_user
    if category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
