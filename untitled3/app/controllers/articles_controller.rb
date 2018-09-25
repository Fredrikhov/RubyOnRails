class ArticlesController < ApplicationController
  before_action :authorize

  def index
    @article = Article.all
    if params[:search]
    @article = Article.search(params[:id]).order("created_at DESC")
    else
      @article = Article,all.order("created_at DESC")
    end
  end

  def new
  @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params_article)
    if @article.save
    redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.search(params[:search])

  end

  private
  def params_article
    params.require(:article).permit(:title, :body)
  end
end