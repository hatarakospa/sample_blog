class ArticlesController < ApplicationController

  def index
    @articles = Article.where(delete_flg: false).order(created_at: :desc)
  end

  def new
    @article = Article.new
    @categories = Category.where(delete_flg: false).order(created_at: :desc)
  end

  def edit
    # パラメータ検証必要
    return redirect_to articles_path if params[:id].to_i <= 0
    @article = Article.find_by(id: params[:id])
    @categories = Category.where(delete_flg: false).order(created_at: :desc)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render "new"
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.assign_attributes(article_params)
    if @article.valid?
     @article.save!
     redirect_to articles_path
    else
      render "edit"
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.delete_flg = true
    @article.save!
    redirect_to articles_path
  end

  private
 def article_params
  params.require(:article).permit(:title, :text, category_ids: [])
 end

end
