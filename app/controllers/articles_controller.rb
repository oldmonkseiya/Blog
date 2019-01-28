class ArticlesController < ApplicationController
  
  def index
    @articles = Article.order(created_at: :desc)
  end

  def new
    @articles = Article.new
  end


  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to @articles, notice:'作成されました'
    else
      render 'new', alert: '作成されていません'
    end
  end

  def show 
    @articles = Article.find(params[:id])
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])
    
    if @articles.update(params[:article].permit(:title, :body, :image))
      redirect_to @articles
    else
      render 'edit'
    end
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy
    
    redirect_to root_path
  end

  private
  
  def article_params 
    params.require(:article).permit(:title, :body, :image) 
  end

end
