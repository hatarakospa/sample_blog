class CategoriesController < ApplicationController
  
  def index
    @categories = Category.where(delete_flg: false).order(created_at: :desc)
  end

  def show
    @category = Category.find_by(id: params[:id])
    #has_manyを定義してあるから使える↓
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def edit
    return redirect_to categories_path if params[:id].to_i <= 0 
    @category = Category.find_by(id: params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save!
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    return redirect_to edit_category_path if params[:id].to_i <= 0
    @category = Category.find_by(id: params[:id])
    @category.assign_attributes(category_params)
    if @category.valid?
       @category.save!
       redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.delete_flg = true
    @category.save!
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
