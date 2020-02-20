class CategoriesController < ApplicationController
  
  def index
    @categories = Category.where(delete_flg: false).order(created_at: :desc)
  end

  def show
    category = Category.find_by(id: params[:id], delete_flg: false) if params[:id].to_i > 0
    #modelでhas_many定義してるのでarticles使える
    articles = category.articles
    @articles = articles.where(delete_flg: false)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find_by(id: params[:id]) if params[:id].to_i > 0
    return redirect_to categories_path if @category.blank?
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
    @category = Category.find_by(params[:id], delete_flg: false) if params[:id].to_i > 0
    return redirect_to categories_path if @category.blank?
    @category.assign_attributes(category_params)
    if @category.valid?
       @category.save!
       redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id]) if params[:id].to_i > 0
    if @category.present? 
      @category.delete_flg = true
      @category.save!
      flash[:success] = "カテゴリを削除しました"
    else
      flash[:error] = "カテゴリがありません"
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.fetch(:category, {}).permit(:name)
  end
end
