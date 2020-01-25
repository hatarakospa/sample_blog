class ArticlesController < ApplicationController

  def index
    @articles = Article.where(delete_flg: false).order(created_at: :desc)
    # activeスコープで定義しているから上と同じ意味になる↓
    # @articles = Article.active.order(created_at: :desc)
  end

  def about
  end

  def contact
  end

  def new
    @article = Article.new
  end

  def edit
    # パラメータ検証必要
    return redirect_to articles_path if params[:id].to_i <= 0
    @article = Article.find_by(id: params[:id])
  end

  def create
    #render plain: params[:article].inspect
    #raise params.inspect
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
    #@article.categories_articles.each do |article_categories| = article_categories.category.name
  end

  def destroy
    #paranoiaは使わない
    #参考：https://qiita.com/rik0/items/89eb4b633e2034c9899d
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
