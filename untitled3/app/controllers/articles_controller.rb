class ArticlesController < ApplicationController
  #Må gjøre disse funksjonen tilgjengelig for søk index, show
  before_action :authorize, :except=>[:index, :show]




  # Denne resetter alle flash slik at flash fra andre views ikke forsetter å bli vist, når man bytter view/controller
  after_action {flash.clear}
  def index
    @article = Article.search(params[:search])
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
