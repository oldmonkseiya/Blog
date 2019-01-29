class ArticlesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  
  def index
    @article = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice:'作成されました'
    else
      render 'new', alert: '作成されていません'
    end
  end

  def show 
    @article = Article.find(params[:id])
    render layout: false # アクションの一番下
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(params[:article].permit(:title, :body, :image))
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to root_path
  end

  private
  
  def article_params 
    params.require(:article).permit(:title, :body, :image) 
  end

end
