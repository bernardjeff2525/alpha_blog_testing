class CategoriesController < ApplicationController
  before_action :set_category, only:[:show,:edit,:update]
  before_action :require_admin,except: [:index,:show]
  def index
    @categories = Category.paginate(page: params[:page], per_page:5)
  end

  def new
    @category = Category.new
  end

  def show

    @category_articles = @category.articles.paginate(page: params[:page],per_page: 3)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category name was succesfully Updated"
      redirect_to category_path(@category)
    else
       render 'edit'
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if !user_signed_in? || (user_signed_in? && !current_user.admin?)
      flash[:danger] = "Access Restiction for Admins ONly"
      redirect_to categories_path
    end
  end
end