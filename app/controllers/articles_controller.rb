class ArticlesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show 
  end

  def new
    @articles = Article.new
  end

  def edit
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to root_path, notice:'作成されました'
    else
      render :new, alert: '作成されていません'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @articles, notice:'Updated'
    else
      render :edit, alert: 'Not updated'
    end
  end

  def destroy
    if @articles.destroy
      redirect_to root_path, notice:'Succeeded'
    else
      redirect_to root_path, alert: 'Not deleted'
    end
  end

  private
  
  def find_post
    @articles = Article.find(params[:id])
  end

  def article_params 
    params.require(:article).permit(:title, :body, :image) 
  end

end
