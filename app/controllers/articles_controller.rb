class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  def set_article

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfuly created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
