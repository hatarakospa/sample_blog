class ArticlesController < ApplicationController

  def index
    @articles = Article.where(delete_flg: false).order(created_at: :desc)
  end

  def new
    @article = Article.new
    @categories = Category.where(delete_flg: false).order(created_at: :desc)
  end

  def edit
    return redirect_to articles_path if params[:id].to_i <= 0
    @article = Article.find_by(id: params[:id])
    @categories = Category.where(delete_flg: false).order(created_at: :desc)
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save!
      redirect_to articles_path
    else
      render :new
    end
  end

  def update
    return redirect_to edit_article_path if params[:id].to_i <= 0
    @article = Article.find_by(id: params[:id])
    @article.assign_attributes(article_params)
    if @article.valid?
     @article.save!
     redirect_to articles_path
    else
      render :edit
    end
  end

  def show
    return redirect_to articles_path if params[:id].to_i <= 0
    return redirect_to articles_path if Article.find_by(id: params[:id]).delete_flg
    @article = Article.find_by(id: params[:id])
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    if @article.present?
      @article.delete_flg = true
      @article.save!
      flash[:success] = "投稿を削除しました"
    else
      flash[:error] = "投稿がありません"
    end
    @articles = Article.where(delete_flg: false).order(created_at: :desc)
    render :index
  end

  private

  def article_params
    params.fetch(:article, {}).permit(:title, :text, category_ids: [])
  end
end
