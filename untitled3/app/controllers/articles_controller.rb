class ArticlesController < ApplicationController
  #Må gjøre disse funksjonen tilgjengelig for søk index, show
  before_action :authorize, :except=>[:index, :show]

  # Reset flash notification so if you change view it wil not shop.
  after_action {flash.clear}
  def index
    @article = Article.all
    @article = Article.search(params[:search])

    # not found any possible solution to show flash error in model. MVC.
    if(@search.blank?)
      flash[:danger] = "No match found, showing all articles"
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
    @article = Article.find(params[:id])
  end

  private
  def params_article
    params.require(:article).permit(:title, :body)
  end
end
