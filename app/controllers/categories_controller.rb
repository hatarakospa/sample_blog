class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def show
    #viewで使わない変数は＠つけなくて良い
    #もっと言うと基本使わない。renderでviewの遷移先を指定できる
    @category = Category.find_by(id: params[:id])
    #has_manyを定義してあるから使える↓
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render "new"
    end
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.assign_attributes(category_params)
    if @category.valid?
       @category.save!
       redirect_to categories_path
    else
      render "edit"
    end
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end

end
